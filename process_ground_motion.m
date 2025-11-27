function [results] = process_ground_motion(acc, dt, options)
% PROCESS_GROUND_MOTION 处理地震动加速度时程
% 根据文献推荐的方法进行滤波和基线校正
%
% 输入:
%   acc - 原始加速度时程 (cm/s^2)
%   dt - 时间步长 (s)
%   options - 处理选项结构体
%       .highcut_freq - 高通滤波角频率 (Hz)，默认25 Hz
%       .lowcut_freq - 低通滤波角频率 (Hz)，默认0.1 Hz
%       .filter_order - 滤波器阶数，默认4
%       .use_acausal - 是否使用非因果滤波，默认true
%       .baseline_method - 基线校正方法: 'mean', 'linear', 'polynomial'
%       .polynomial_order - 多项式阶数（如果使用polynomial方法），默认2
%
% 输出:
%   results - 结果结构体，包含：
%       .acc_filtered - 滤波后的加速度 (cm/s^2)
%       .vel - 速度 (cm/s)
%       .disp - 位移 (cm)
%       .PGA - 峰值加速度 (cm/s^2)
%       .PGV - 峰值速度 (cm/s)
%       .PGD - 峰值位移 (cm)
%       .CAV - 累积绝对速度 (cm/s)
%       .time - 时间向量 (s)

    % 设置默认参数
    if nargin < 3
        options = struct();
    end
    if ~isfield(options, 'highcut_freq'), options.highcut_freq = 25; end
    if ~isfield(options, 'lowcut_freq'), options.lowcut_freq = 0.1; end
    if ~isfield(options, 'filter_order'), options.filter_order = 4; end
    if ~isfield(options, 'use_acausal'), options.use_acausal = true; end
    if ~isfield(options, 'baseline_method'), options.baseline_method = 'mean'; end
    if ~isfield(options, 'polynomial_order'), options.polynomial_order = 2; end
    
    % 生成时间向量
    n = length(acc);
    time = (0:n-1)' * dt;
    
    %% 步骤1: 基线校正（去均值）
    fprintf('步骤1: 基线校正...\n');
    acc_baseline = baseline_correction(acc, time, options.baseline_method, options.polynomial_order);
    
    %% 步骤2: 带通滤波
    fprintf('步骤2: 带通滤波 (%.2f - %.2f Hz)...\n', options.lowcut_freq, options.highcut_freq);
    acc_filtered = bandpass_filter(acc_baseline, dt, options.lowcut_freq, ...
                                    options.highcut_freq, options.filter_order, ...
                                    options.use_acausal);
    
    %% 步骤3: 积分得到速度和位移
    fprintf('步骤3: 计算速度和位移...\n');
    vel = cumtrapz(time, acc_filtered);
    disp = cumtrapz(time, vel);
    
    %% 步骤4: 计算峰值参数
    fprintf('步骤4: 计算峰值参数...\n');
    PGA = max(abs(acc_filtered));
    PGV = max(abs(vel));
    PGD = max(abs(disp));
    
    %% 步骤5: 计算CAV (Cumulative Absolute Velocity)
    % CAV是评估地震动破坏潜力的重要参数
    CAV = trapz(time, abs(acc_filtered)) / 981;  % 转换为 g-sec
    
    %% 输出结果
    results = struct();
    results.acc_filtered = acc_filtered;
    results.vel = vel;
    results.disp = disp;
    results.PGA = PGA;
    results.PGV = PGV;
    results.PGD = PGD;
    results.CAV = CAV;
    results.time = time;
    
    fprintf('处理完成!\n');
    fprintf('PGA = %.3f cm/s^2 (%.4f g)\n', PGA, PGA/981);
    fprintf('PGV = %.3f cm/s\n', PGV);
    fprintf('PGD = %.3f cm\n', PGD);
    fprintf('CAV = %.3f g-sec\n', CAV);
end

function acc_corrected = baseline_correction(acc, time, method, poly_order)
    % 基线校正函数
    
    switch lower(method)
        case 'mean'
            % 简单去均值
            acc_corrected = acc - mean(acc);
            
        case 'linear'
            % 线性去趋势
            p = polyfit(time, acc, 1);
            trend = polyval(p, time);
            acc_corrected = acc - trend;
            
        case 'polynomial'
            % 多项式去趋势
            p = polyfit(time, acc, poly_order);
            trend = polyval(p, time);
            acc_corrected = acc - trend;
            
        otherwise
            warning('未知的基线校正方法，使用去均值');
            acc_corrected = acc - mean(acc);
    end
end

function acc_filtered = bandpass_filter(acc, dt, f_low, f_high, order, use_acausal)
    % 带通滤波函数
    % 使用Butterworth滤波器
    
    fs = 1/dt;  % 采样频率
    nyq = fs/2;  % Nyquist频率
    
    % 归一化频率
    Wn_low = f_low / nyq;
    Wn_high = f_high / nyq;
    
    % 检查频率有效性
    if Wn_low <= 0 || Wn_low >= 1
        error('低通频率超出有效范围');
    end
    if Wn_high <= 0 || Wn_high >= 1
        error('高通频率超出有效范围');
    end
    if Wn_low >= Wn_high
        error('低通频率必须小于高通频率');
    end
    
    % 设计Butterworth带通滤波器
    [b, a] = butter(order, [Wn_low, Wn_high], 'bandpass');
    
    % 添加零填充以减少边界效应
    pad_length = min(round(length(acc) * 0.1), 500);
    acc_padded = [zeros(pad_length, 1); acc; zeros(pad_length, 1)];
    
    % 滤波
    if use_acausal
        % 非因果滤波（零相位）- 前向和后向滤波
        acc_filtered_padded = filtfilt(b, a, acc_padded);
    else
        % 因果滤波
        acc_filtered_padded = filter(b, a, acc_padded);
    end
    
    % 去除填充部分
    acc_filtered = acc_filtered_padded(pad_length+1:end-pad_length);
end
