%% BATCH_PROCESS_ALL - 地震动数据批量处理程序
% 完整的地震动数据处理工具，支持多种文件格式和处理选项
%
% 功能:
%   1. 自动识别文件格式（K-NET/KiK-net和两列文本格式）
%   2. 基线校正（去均值、线性、多项式）
%   3. 带通滤波（Butterworth，支持因果和非因果）
%   4. 计算速度和位移时程
%   5. 计算PSV反应谱（Newmark-Beta方法）
%   6. 计算强度参数：PGA, PGV, PGD, CAV, Arias强度, 有效持时, SI, HI, Tc, Tm
%   7. 批量处理多个文件
%   8. 生成汇总报告和图形
%
% 支持格式:
%   - .EW, .NS, .UD - 日本K-NET/KiK-net格式
%   - .txt - 两列格式（第一列时间，第二列加速度）
%
% 输出:
%   - *_acc.dat  - 滤波后加速度
%   - *_vel.dat  - 速度时程
%   - *_disp.dat - 位移时程
%   - *_PSV.dat  - 伪速度反应谱
%   - *_IM.txt   - 强度参数报告
%   - *_plot.png - 汇总图
%   - summary.csv - 所有文件汇总表
%   - report.txt  - 处理报告
%
% 兼容性: MATLAB R2018a及以上版本
%
% 作者: 地震动数据处理工具
% 日期: 2024

clear; clc; close all;

%% ==========================================================================
%                              主程序入口
% ==========================================================================

fprintf('=======================================================\n');
fprintf('          地震动数据批量处理程序 v2.0\n');
fprintf('=======================================================\n\n');

% 显示用户菜单
fprintf('请选择文件输入方式:\n');
fprintf('  1. 选择文件夹（图形界面）\n');
fprintf('  2. 手动选择文件（图形界面）\n');
fprintf('  3. 输入文件夹路径\n');
fprintf('  4. 使用当前目录\n');
fprintf('\n');

choice = input('请输入选项 [1-4]: ');

% 根据用户选择获取文件列表
switch choice
    case 1
        % 选择文件夹
        folder_path = uigetdir(pwd, '请选择包含地震动文件的文件夹');
        if folder_path == 0
            error('用户取消选择');
        end
        file_list = get_earthquake_files(folder_path);
        
    case 2
        % 手动选择文件
        [files, path] = uigetfile({'*.EW;*.NS;*.UD;*.txt', '地震动文件 (*.EW, *.NS, *.UD, *.txt)'; ...
                                    '*.*', '所有文件 (*.*)'}, ...
                                   '选择地震动文件', 'MultiSelect', 'on');
        if isequal(files, 0)
            error('用户取消选择');
        end
        if ischar(files)
            files = {files};
        end
        file_list = struct('name', {}, 'folder', {});
        for i = 1:length(files)
            file_list(i).name = files{i};
            file_list(i).folder = path;
        end
        folder_path = path;
        
    case 3
        % 输入文件夹路径
        folder_path = input('请输入文件夹路径: ', 's');
        if ~exist(folder_path, 'dir')
            error('文件夹不存在: %s', folder_path);
        end
        file_list = get_earthquake_files(folder_path);
        
    case 4
        % 使用当前目录
        folder_path = pwd;
        file_list = get_earthquake_files(folder_path);
        
    otherwise
        error('无效的选项');
end

n_files = length(file_list);
if n_files == 0
    error('未找到任何地震动文件！支持格式: .EW, .NS, .UD, .txt');
end

fprintf('\n找到 %d 个地震动文件\n\n', n_files);

%% 配置处理参数
config = struct();
config.output_folder = fullfile(folder_path, 'batch_results');
config.highcut_freq = 25;        % 高通滤波频率 (Hz)
config.lowcut_freq = 0.1;        % 低通滤波频率 (Hz)
config.filter_order = 4;         % 滤波器阶数
config.use_acausal = true;       % 使用非因果滤波
config.baseline_method = 'mean'; % 基线校正方法: 'mean', 'linear', 'polynomial'
config.polynomial_order = 2;     % 多项式阶数（使用polynomial方法时）
config.damping_ratio = 0.05;     % 阻尼比
config.period_min = 0.02;        % 周期范围最小值 (s)
config.period_max = 50;          % 周期范围最大值 (s)
config.n_periods = 1000;         % 周期点数

% 创建输出文件夹
if ~exist(config.output_folder, 'dir')
    mkdir(config.output_folder);
end

%% 初始化汇总数据
summary_data = cell(n_files + 1, 15);
summary_data(1, :) = {'文件名', '测站', 'PGA(gal)', 'PGA(g)', 'PGV(cm/s)', ...
                      'PGD(cm)', 'CAV(g-sec)', 'Ia(cm/s)', '持时(s)', ...
                      'SI(cm)', 'HI(cm)', 'Tc(s)', 'Tm(s)', 'PGV/PGA(s)', '状态'};
success_count = 0;

%% 批量处理
fprintf('开始批量处理...\n');
fprintf('=======================================================\n\n');

for i = 1:n_files
    filename = file_list(i).name;
    if isfield(file_list, 'folder')
        filepath = fullfile(file_list(i).folder, filename);
    else
        filepath = fullfile(folder_path, filename);
    end
    
    fprintf('===== 处理 [%d/%d]: %s =====\n', i, n_files, filename);
    
    try
        % 1. 读取数据
        [acc_raw, dt, header] = read_earthquake_file(filepath);
        
        % 2. 处理地震动
        options = struct();
        options.highcut_freq = config.highcut_freq;
        options.lowcut_freq = config.lowcut_freq;
        options.filter_order = config.filter_order;
        options.use_acausal = config.use_acausal;
        options.baseline_method = config.baseline_method;
        options.polynomial_order = config.polynomial_order;
        
        results = process_ground_motion_data(acc_raw, dt, options);
        
        % 3. 计算PSV反应谱
        period_range = [config.period_min, config.period_max, config.n_periods];
        [PSV, periods] = calculate_psv_spectrum(results.acc_filtered, dt, ...
                                                 config.damping_ratio, period_range);
        
        % 4. 计算强度参数
        IM = calculate_im_params(results.acc_filtered, results.vel, ...
                                  results.disp, dt, PSV, periods);
        
        % 5. 保存结果文件
        [~, base_name, ~] = fileparts(filename);
        output_prefix = fullfile(config.output_folder, base_name);
        
        % 保存加速度时程
        save_two_column_file([output_prefix, '_acc.dat'], results.time, results.acc_filtered, ...
                             '时间(s)', '加速度(cm/s^2)');
        
        % 保存速度时程
        save_two_column_file([output_prefix, '_vel.dat'], results.time, results.vel, ...
                             '时间(s)', '速度(cm/s)');
        
        % 保存位移时程
        save_two_column_file([output_prefix, '_disp.dat'], results.time, results.disp, ...
                             '时间(s)', '位移(cm)');
        
        % 保存PSV反应谱
        save_two_column_file([output_prefix, '_PSV.dat'], periods, PSV, ...
                             '周期(s)', 'PSV(cm/s)');
        
        % 保存强度参数报告
        save_im_report([output_prefix, '_IM.txt'], filename, header, IM, config);
        
        % 6. 生成图形
        save_summary_plot([output_prefix, '_plot.png'], filename, results, periods, PSV, config);
        
        % 7. 添加到汇总表
        success_count = success_count + 1;
        summary_data(success_count + 1, :) = {filename, header.station_code, ...
            IM.PGA, IM.PGA/981, IM.PGV, IM.PGD, IM.CAV, IM.Ia, IM.D_5_95, ...
            IM.SI, IM.HI, IM.Tc, IM.Tm, IM.PGV_PGA_ratio, '成功'};
        
        fprintf('处理成功!\n\n');
        
    catch ME
        fprintf('错误: %s\n\n', ME.message);
        % 记录失败条目到汇总表末尾（不影响成功条目的连续性）
    end
end

%% 保存汇总结果
fprintf('=======================================================\n');
fprintf('保存汇总结果...\n');

% 保存summary.csv
summary_file = fullfile(config.output_folder, 'summary.csv');
save_summary_csv(summary_file, summary_data(1:success_count+1, :));

% 保存report.txt
report_file = fullfile(config.output_folder, 'report.txt');
save_processing_report(report_file, config, summary_data(1:success_count+1, :), n_files, success_count);

fprintf('\n===== 批量处理完成! =====\n');
fprintf('结果保存在: %s\n', config.output_folder);
fprintf('处理成功: %d / %d 个文件\n', success_count, n_files);

%% ==========================================================================
%                              辅助函数
% ==========================================================================

function file_list = get_earthquake_files(folder_path)
% GET_EARTHQUAKE_FILES 获取文件夹中所有地震动文件
% 支持格式: .EW, .NS, .UD, .txt
    
    file_list = [];
    
    % 搜索各种格式
    patterns = {'*.EW', '*.NS', '*.UD', '*.txt'};
    for j = 1:length(patterns)
        files = dir(fullfile(folder_path, patterns{j}));
        for k = 1:length(files)
            files(k).folder = folder_path;
        end
        file_list = [file_list; files]; %#ok<AGROW>
    end
end

function [acc, dt, header] = read_earthquake_file(filepath)
% READ_EARTHQUAKE_FILE 读取地震动文件（自动识别格式）
% 支持K-NET/KiK-net格式(.EW/.NS/.UD)和两列文本格式(.txt)
    
    [~, ~, ext] = fileparts(filepath);
    ext = upper(ext);
    
    header = struct();
    header.station_code = 'Unknown';
    header.sampling_freq = NaN;
    header.scale_factor = 1;
    header.max_acc = NaN;
    header.origin_time = '';
    header.duration = NaN;
    
    if any(strcmp(ext, {'.EW', '.NS', '.UD'}))
        % K-NET/KiK-net格式
        [acc, dt, header] = read_knet_file(filepath);
    elseif strcmp(ext, '.TXT')
        % 两列文本格式
        [acc, dt] = read_txt_file(filepath);
    else
        error('不支持的文件格式: %s', ext);
    end
end

function [acc, dt, header] = read_knet_file(filepath)
% READ_KNET_FILE 读取日本K-NET/KiK-net格式文件
    
    fid = fopen(filepath, 'r');
    if fid == -1
        error('无法打开文件: %s', filepath);
    end
    
    header = struct();
    header.station_code = 'Unknown';
    header.sampling_freq = 100;
    header.scale_factor = 1;
    header.max_acc = NaN;
    header.origin_time = '';
    header.duration = NaN;
    dt = 0.01;
    
    % 读取头文件信息（前17行）
    line_count = 0;
    while line_count < 17
        line_text = fgetl(fid);
        line_count = line_count + 1;
        
        if ~ischar(line_text)
            break;
        end
        
        if contains(line_text, 'Sampling Freq')
            parts = strsplit(line_text);
            freq_str = parts{end};
            header.sampling_freq = str2double(strrep(freq_str, 'Hz', ''));
            dt = 1.0/header.sampling_freq;
        elseif contains(line_text, 'Duration Time')
            parts = strsplit(line_text);
            header.duration = str2double(parts{end});
        elseif contains(line_text, 'Scale Factor')
            parts = strsplit(line_text);
            scale_parts = strsplit(parts{end}, '/');
            numerator = str2double(strrep(scale_parts{1}, '(gal)', ''));
            denominator = str2double(scale_parts{2});
            if ~isnan(numerator) && ~isnan(denominator) && denominator ~= 0
                header.scale_factor = numerator/denominator;
            end
        elseif contains(line_text, 'Max. Acc.')
            parts = strsplit(line_text);
            header.max_acc = str2double(parts{end});
        elseif contains(line_text, 'Origin Time')
            if length(line_text) > 19
                header.origin_time = strtrim(line_text(20:end));
            end
        elseif contains(line_text, 'Station Code')
            if length(line_text) > 19
                header.station_code = strtrim(line_text(20:end));
            end
        end
    end
    
    % 读取加速度数据
    acc_counts = [];
    while ~feof(fid)
        line_text = fgetl(fid);
        if ischar(line_text)
            values = sscanf(line_text, '%f');
            if ~isempty(values)
                acc_counts = [acc_counts; values(:)]; %#ok<AGROW>
            end
        end
    end
    fclose(fid);
    
    % 转换为加速度值 (gal = cm/s^2)
    acc = acc_counts*header.scale_factor;
    
    fprintf('  格式: K-NET/KiK-net\n');
    fprintf('  采样率: %.0f Hz, 时间步长: %.4f s\n', header.sampling_freq, dt);
    fprintf('  数据点数: %d, 持续时间: %.1f s\n', length(acc), length(acc)*dt);
    fprintf('  最大加速度: %.3f gal\n', max(abs(acc)));
end

function [acc, dt] = read_txt_file(filepath)
% READ_TXT_FILE 读取两列文本格式文件
% 格式: 第一列时间，第二列加速度
    
    data = load(filepath);
    
    if size(data, 2) < 2
        error('文本文件必须至少有两列数据');
    end
    
    time = data(:, 1);
    acc = data(:, 2);
    
    % 计算时间步长
    if length(time) > 1
        dt = mean(diff(time));
    else
        dt = 0.01;
    end
    
    fprintf('  格式: 两列文本\n');
    fprintf('  时间步长: %.4f s\n', dt);
    fprintf('  数据点数: %d, 持续时间: %.1f s\n', length(acc), time(end) - time(1));
    fprintf('  最大加速度: %.3f\n', max(abs(acc)));
end

function results = process_ground_motion_data(acc, dt, options)
% PROCESS_GROUND_MOTION_DATA 处理地震动加速度时程
% 进行基线校正、滤波和积分
    
    % 设置默认参数
    if ~isfield(options, 'highcut_freq'), options.highcut_freq = 25; end
    if ~isfield(options, 'lowcut_freq'), options.lowcut_freq = 0.1; end
    if ~isfield(options, 'filter_order'), options.filter_order = 4; end
    if ~isfield(options, 'use_acausal'), options.use_acausal = true; end
    if ~isfield(options, 'baseline_method'), options.baseline_method = 'mean'; end
    if ~isfield(options, 'polynomial_order'), options.polynomial_order = 2; end
    
    % 生成时间向量
    n = length(acc);
    time = (0:n-1)'*dt;
    
    % 步骤1: 基线校正
    fprintf('  基线校正 (%s)...\n', options.baseline_method);
    acc_baseline = apply_baseline_correction(acc, time, options.baseline_method, options.polynomial_order);
    
    % 步骤2: 带通滤波
    fprintf('  带通滤波 (%.2f - %.2f Hz)...\n', options.lowcut_freq, options.highcut_freq);
    acc_filtered = apply_bandpass_filter(acc_baseline, dt, options.lowcut_freq, ...
                                          options.highcut_freq, options.filter_order, ...
                                          options.use_acausal);
    
    % 步骤3: 积分得到速度和位移
    fprintf('  计算速度和位移...\n');
    vel = cumtrapz(time, acc_filtered);
    disp_data = cumtrapz(time, vel);
    
    % 输出结果
    results = struct();
    results.acc_filtered = acc_filtered;
    results.vel = vel;
    results.disp = disp_data;
    results.time = time;
    results.PGA = max(abs(acc_filtered));
    results.PGV = max(abs(vel));
    results.PGD = max(abs(disp_data));
    
    fprintf('  PGA = %.3f gal (%.4f g), PGV = %.3f cm/s, PGD = %.3f cm\n', ...
            results.PGA, results.PGA/981, results.PGV, results.PGD);
end

function acc_corrected = apply_baseline_correction(acc, time, method, poly_order)
% APPLY_BASELINE_CORRECTION 基线校正
    
    switch lower(method)
        case 'mean'
            acc_corrected = acc - mean(acc);
        case 'linear'
            p = polyfit(time, acc, 1);
            trend = polyval(p, time);
            acc_corrected = acc - trend;
        case 'polynomial'
            p = polyfit(time, acc, poly_order);
            trend = polyval(p, time);
            acc_corrected = acc - trend;
        otherwise
            warning('未知的基线校正方法，使用去均值');
            acc_corrected = acc - mean(acc);
    end
end

function acc_filtered = apply_bandpass_filter(acc, dt, f_low, f_high, order, use_acausal)
% APPLY_BANDPASS_FILTER 带通滤波（Butterworth滤波器）
    
    fs = 1/dt;
    nyq = fs/2;
    
    % 归一化频率
    Wn_low = f_low/nyq;
    Wn_high = f_high/nyq;
    
    % 检查频率有效性
    if Wn_low <= 0 || Wn_low >= 1
        error('低切频率超出有效范围');
    end
    if Wn_high <= 0 || Wn_high >= 1
        error('高切频率超出有效范围');
    end
    if Wn_low >= Wn_high
        error('低切频率必须小于高切频率');
    end
    
    % 设计Butterworth带通滤波器
    [b, a] = butter(order, [Wn_low, Wn_high], 'bandpass');
    
    % 添加零填充以减少边界效应
    pad_length = min(round(length(acc)*0.1), 500);
    acc_padded = [zeros(pad_length, 1); acc; zeros(pad_length, 1)];
    
    % 滤波
    if use_acausal
        % 非因果滤波（零相位）
        acc_filtered_padded = filtfilt(b, a, acc_padded);
    else
        % 因果滤波
        acc_filtered_padded = filter(b, a, acc_padded);
    end
    
    % 去除填充部分
    acc_filtered = acc_filtered_padded(pad_length+1:end-pad_length);
end

function [PSV, periods] = calculate_psv_spectrum(acc, dt, damping_ratio, period_range)
% CALCULATE_PSV_SPECTRUM 计算伪速度反应谱（Newmark-Beta方法）
    
    if nargin < 3 || isempty(damping_ratio)
        damping_ratio = 0.05;
    end
    if nargin < 4 || isempty(period_range)
        period_range = [0.02, 50, 1000];
    end
    
    % 生成周期向量（对数分布）
    periods = logspace(log10(period_range(1)), log10(period_range(2)), period_range(3))';
    
    % 初始化PSV数组
    PSV = zeros(length(periods), 1);
    
    fprintf('  计算反应谱 (阻尼比 = %.1f%%)...\n', damping_ratio*100);
    
    % 对每个周期计算最大反应
    for k = 1:length(periods)
        T = periods(k);
        omega_n = 2*pi/T;
        
        % 使用Newmark-Beta方法计算SDOF响应
        [~, vel_rel, ~] = solve_sdof_newmark(acc, dt, omega_n, damping_ratio);
        
        % PSV = 最大相对速度
        PSV(k) = max(abs(vel_rel));
    end
    
    fprintf('  反应谱计算完成\n');
end

function [disp_rel, vel_rel, acc_abs] = solve_sdof_newmark(acc_ground, dt, omega_n, zeta)
% SOLVE_SDOF_NEWMARK 使用Newmark-Beta方法求解单自由度系统响应
    
    % Newmark-Beta参数（平均加速度法）
    gamma = 0.5;
    beta = 0.25;
    
    % 系统参数
    m = 1;
    k = m*omega_n^2;
    c = 2*m*omega_n*zeta;
    
    % 初始化
    n = length(acc_ground);
    disp_rel = zeros(n, 1);
    vel_rel = zeros(n, 1);
    acc_rel = zeros(n, 1);
    
    % 初始条件
    disp_rel(1) = 0;
    vel_rel(1) = 0;
    acc_rel(1) = -acc_ground(1);
    
    % 计算有效刚度
    k_eff = k + gamma/(beta*dt)*c + 1/(beta*dt^2)*m;
    
    % 常数
    a_coef = m/(beta*dt) + gamma*c/beta;
    b_coef = m/(2*beta) + dt*c*(gamma/(2*beta) - 1);
    
    % 时间步进
    for j = 1:n-1
        dp = -m*(acc_ground(j+1) - acc_ground(j));
        dF_eff = dp + a_coef*vel_rel(j) + b_coef*acc_rel(j);
        
        ddisp = dF_eff/k_eff;
        dvel = gamma/(beta*dt)*ddisp - gamma/beta*vel_rel(j) + dt*(1 - gamma/(2*beta))*acc_rel(j);
        
        disp_rel(j+1) = disp_rel(j) + ddisp;
        vel_rel(j+1) = vel_rel(j) + dvel;
        acc_rel(j+1) = (-c*vel_rel(j+1) - k*disp_rel(j+1))/m;
    end
    
    % 绝对加速度
    acc_abs = acc_rel + acc_ground;
end

function IM = calculate_im_params(acc, vel, disp_data, dt, PSV, periods)
% CALCULATE_IM_PARAMS 计算地震动强度参数
    
    time = (0:length(acc)-1)'*dt;
    
    % 基本强度参数
    IM.PGA = max(abs(acc));
    IM.PGV = max(abs(vel));
    IM.PGD = max(abs(disp_data));
    
    % CAV (Cumulative Absolute Velocity)
    IM.CAV = trapz(time, abs(acc))/981;
    
    % Arias Intensity
    IM.Ia = pi/(2*981)*trapz(time, acc.^2);
    
    % 有效持时 (5%-95% Arias Intensity)
    cumulative_Ia = cumtrapz(time, acc.^2);
    if cumulative_Ia(end) > 0
        cumulative_Ia = cumulative_Ia/cumulative_Ia(end);
        idx_5 = find(cumulative_Ia >= 0.05, 1, 'first');
        idx_95 = find(cumulative_Ia >= 0.95, 1, 'first');
        if ~isempty(idx_5) && ~isempty(idx_95)
            IM.D_5_95 = time(idx_95) - time(idx_5);
        else
            IM.D_5_95 = NaN;
        end
    else
        IM.D_5_95 = NaN;
    end
    
    % 均方根加速度
    IM.RMS_acc = sqrt(mean(acc.^2));
    
    % 谱强度 SI (0.1-2.5秒)
    idx_si = (periods >= 0.1) & (periods <= 2.5);
    if any(idx_si)
        IM.SI = trapz(periods(idx_si), PSV(idx_si));
    else
        IM.SI = NaN;
    end
    
    % 房屋破坏指数 HI (0.1-0.5秒)
    idx_hi = (periods >= 0.1) & (periods <= 0.5);
    if any(idx_hi)
        IM.HI = trapz(periods(idx_hi), PSV(idx_hi));
    else
        IM.HI = NaN;
    end
    
    % 特征周期 Tc
    [~, idx_peak] = max(PSV);
    IM.Tc = periods(idx_peak);
    
    % 平均周期 Tm
    fs = 1/dt;
    [psd, freq] = pwelch(acc, [], [], [], fs);
    m0 = trapz(freq, psd);
    m2 = trapz(freq, freq.^2.*psd);
    if m2 > 0 && m0 > 0
        IM.Tm = 2*pi*sqrt(m0/m2);
    else
        IM.Tm = NaN;
    end
    
    % PGV/PGA比值
    if IM.PGA > 0
        IM.PGV_PGA_ratio = IM.PGV/IM.PGA;
    else
        IM.PGV_PGA_ratio = NaN;
    end
end

function save_two_column_file(filepath, col1, col2, header1, header2)
% SAVE_TWO_COLUMN_FILE 保存两列数据文件
    
    fid = fopen(filepath, 'w');
    if fid == -1
        error('无法创建文件: %s', filepath);
    end
    
    fprintf(fid, '%s\t%s\n', header1, header2);
    for j = 1:length(col1)
        fprintf(fid, '%.6e\t%.6e\n', col1(j), col2(j));
    end
    fclose(fid);
end

function save_im_report(filepath, filename, header, IM, config)
% SAVE_IM_REPORT 保存强度参数报告
    
    fid = fopen(filepath, 'w');
    if fid == -1
        error('无法创建文件: %s', filepath);
    end
    
    fprintf(fid, '地震动强度参数报告\n');
    fprintf(fid, '==========================================\n\n');
    fprintf(fid, '文件: %s\n', filename);
    fprintf(fid, '测站: %s\n', header.station_code);
    fprintf(fid, '处理日期: %s\n\n', datestr(now, 'yyyy-mm-dd HH:MM:SS'));
    
    fprintf(fid, '处理参数:\n');
    fprintf(fid, '  滤波频率: %.2f - %.2f Hz\n', config.lowcut_freq, config.highcut_freq);
    fprintf(fid, '  滤波器阶数: %d阶 Butterworth\n', config.filter_order);
    if config.use_acausal
        fprintf(fid, '  滤波类型: 非因果（零相位）\n');
    else
        fprintf(fid, '  滤波类型: 因果\n');
    end
    fprintf(fid, '  基线校正: %s\n', config.baseline_method);
    fprintf(fid, '  阻尼比: %.1f%%\n\n', config.damping_ratio*100);
    
    fprintf(fid, '强度参数:\n');
    fprintf(fid, '==========================================\n');
    fprintf(fid, 'PGA = %.3f cm/s^2 (%.4f g)\n', IM.PGA, IM.PGA/981);
    fprintf(fid, 'PGV = %.3f cm/s\n', IM.PGV);
    fprintf(fid, 'PGD = %.3f cm\n', IM.PGD);
    fprintf(fid, 'CAV = %.3f g-sec\n', IM.CAV);
    fprintf(fid, 'Arias强度 (Ia) = %.3f cm/s\n', IM.Ia);
    fprintf(fid, '有效持时 (5%%-95%%) = %.2f s\n', IM.D_5_95);
    fprintf(fid, 'RMS加速度 = %.3f cm/s^2\n', IM.RMS_acc);
    fprintf(fid, '谱强度 (SI) = %.3f cm\n', IM.SI);
    fprintf(fid, '房屋指数 (HI) = %.3f cm\n', IM.HI);
    fprintf(fid, '特征周期 (Tc) = %.3f s\n', IM.Tc);
    fprintf(fid, '平均周期 (Tm) = %.3f s\n', IM.Tm);
    fprintf(fid, 'PGV/PGA = %.4f s\n', IM.PGV_PGA_ratio);
    fprintf(fid, '==========================================\n');
    fclose(fid);
end

function save_summary_plot(filepath, filename, results, periods, PSV, config)
% SAVE_SUMMARY_PLOT 保存汇总图
    
    fig = figure('Visible', 'off', 'Position', [100, 100, 1200, 800]);
    
    subplot(4, 1, 1)
    plot(results.time, results.acc_filtered, 'b', 'LineWidth', 1);
    xlabel('时间 (s)');
    ylabel('加速度 (cm/s^2)');
    title(['加速度时程 - ', filename], 'Interpreter', 'none');
    grid on;
    
    subplot(4, 1, 2)
    plot(results.time, results.vel, 'r', 'LineWidth', 1);
    xlabel('时间 (s)');
    ylabel('速度 (cm/s)');
    title('速度时程');
    grid on;
    
    subplot(4, 1, 3)
    plot(results.time, results.disp, 'g', 'LineWidth', 1);
    xlabel('时间 (s)');
    ylabel('位移 (cm)');
    title('位移时程');
    grid on;
    
    subplot(4, 1, 4)
    loglog(periods, PSV, 'b', 'LineWidth', 2);
    xlabel('周期 (s)');
    ylabel('PSV (cm/s)');
    title(sprintf('伪速度反应谱 (阻尼比 = %.1f%%)', config.damping_ratio*100));
    grid on;
    xlim([0.01, 100]);
    
    saveas(fig, filepath);
    close(fig);
end

function save_summary_csv(filepath, data)
% SAVE_SUMMARY_CSV 保存汇总CSV文件
    
    fid = fopen(filepath, 'w');
    if fid == -1
        error('无法创建文件: %s', filepath);
    end
    
    n_rows = size(data, 1);
    n_cols = size(data, 2);
    
    for j = 1:n_rows
        for k = 1:n_cols
            val = data{j, k};
            if ischar(val)
                fprintf(fid, '%s', val);
            elseif isnumeric(val)
                if isnan(val)
                    fprintf(fid, 'NaN');
                else
                    fprintf(fid, '%.6g', val);
                end
            else
                fprintf(fid, '%s', char(val));
            end
            if k < n_cols
                fprintf(fid, ',');
            end
        end
        fprintf(fid, '\n');
    end
    fclose(fid);
end

function save_processing_report(filepath, config, summary_data, n_total, n_success)
% SAVE_PROCESSING_REPORT 保存处理报告
    
    fid = fopen(filepath, 'w');
    if fid == -1
        error('无法创建文件: %s', filepath);
    end
    
    fprintf(fid, '地震动批量处理报告\n');
    fprintf(fid, '==========================================\n\n');
    fprintf(fid, '处理日期: %s\n', datestr(now, 'yyyy-mm-dd HH:MM:SS'));
    fprintf(fid, '处理文件数: %d\n', n_total);
    fprintf(fid, '成功处理: %d\n', n_success);
    fprintf(fid, '失败数: %d\n\n', n_total - n_success);
    
    fprintf(fid, '处理参数:\n');
    fprintf(fid, '  高通滤波频率: %.2f Hz\n', config.highcut_freq);
    fprintf(fid, '  低通滤波频率: %.2f Hz\n', config.lowcut_freq);
    fprintf(fid, '  滤波器阶数: %d\n', config.filter_order);
    if config.use_acausal
        fprintf(fid, '  滤波类型: 非因果\n');
    else
        fprintf(fid, '  滤波类型: 因果\n');
    end
    fprintf(fid, '  基线校正: %s\n', config.baseline_method);
    fprintf(fid, '  阻尼比: %.1f%%\n\n', config.damping_ratio*100);
    
    if n_success > 1
        % 从summary_data提取数值统计
        pga_vals = [];
        pgv_vals = [];
        pgd_vals = [];
        for j = 2:size(summary_data, 1)
            if isnumeric(summary_data{j, 3}) && ~isnan(summary_data{j, 3})
                pga_vals = [pga_vals; summary_data{j, 3}]; %#ok<AGROW>
            end
            if isnumeric(summary_data{j, 5}) && ~isnan(summary_data{j, 5})
                pgv_vals = [pgv_vals; summary_data{j, 5}]; %#ok<AGROW>
            end
            if isnumeric(summary_data{j, 6}) && ~isnan(summary_data{j, 6})
                pgd_vals = [pgd_vals; summary_data{j, 6}]; %#ok<AGROW>
            end
        end
        
        if ~isempty(pga_vals)
            fprintf(fid, '统计结果:\n');
            fprintf(fid, '  PGA范围: %.3f - %.3f cm/s^2\n', min(pga_vals), max(pga_vals));
            if ~isempty(pgv_vals)
                fprintf(fid, '  PGV范围: %.3f - %.3f cm/s\n', min(pgv_vals), max(pgv_vals));
            end
            if ~isempty(pgd_vals)
                fprintf(fid, '  PGD范围: %.3f - %.3f cm\n', min(pgd_vals), max(pgd_vals));
            end
        end
    end
    
    fprintf(fid, '\n==========================================\n');
    fprintf(fid, '处理完成\n');
    fclose(fid);
end
