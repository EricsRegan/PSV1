% BATCH_PROCESS_GROUND_MOTIONS - 批量处理地震动数据
% 批量读取、处理多个地震动记录并输出结果
%
% 使用方法：
%   1. 将所有EW格式的地震动文件放在同一文件夹
%   2. 运行本脚本
%   3. 结果将保存在 'batch_results' 文件夹中

clear; clc; close all;

%% 配置参数
config = struct();
config.input_folder = '.';  % 输入文件夹（当前目录）
config.output_folder = 'batch_results';  % 输出文件夹
config.file_pattern = '*.EW';  % 文件匹配模式

% 处理参数（与SeismoSignal保持一致）
config.highcut_freq = 25;        % 高通滤波频率 (Hz)
config.lowcut_freq = 0.1;        % 低通滤波频率 (Hz)
config.filter_order = 4;         % 滤波器阶数
config.use_acausal = true;       % 使用非因果滤波
config.baseline_method = 'mean'; % 基线校正方法
config.damping_ratio = 0.05;     % 阻尼比
config.period_range = [0.02, 50, 1000];  % PSV计算周期范围

%% 创建输出文件夹
if ~exist(config.output_folder, 'dir')
    mkdir(config.output_folder);
end

%% 查找所有地震动文件
file_list = dir(fullfile(config.input_folder, config.file_pattern));
n_files = length(file_list);

if n_files == 0
    error('未找到匹配的地震动文件！');
end

fprintf('找到 %d 个地震动文件\n', n_files);
fprintf('开始批量处理...\n\n');

%% 初始化汇总表
summary_table = table();

%% 批量处理
for i = 1:n_files
    filename = file_list(i).name;
    fprintf('===== 处理 [%d/%d]: %s =====\n', i, n_files, filename);
    
    try
        % 1. 读取数据
        filepath = fullfile(config.input_folder, filename);
        [acc_raw, dt, header] = read_ew_file(filepath);
        
        % 2. 处理参数设置
        options = struct();
        options.highcut_freq = config.highcut_freq;
        options.lowcut_freq = config.lowcut_freq;
        options.filter_order = config.filter_order;
        options.use_acausal = config.use_acausal;
        options.baseline_method = config.baseline_method;
        
        % 3. 处理地震动
        results = process_ground_motion(acc_raw, dt, options);
        
        % 4. 计算PSV
        [PSV, periods] = calculate_response_spectrum(results.acc_filtered, dt, ...
                                                     config.damping_ratio, ...
                                                     config.period_range);
        
        % 5. 计算强度参数
        IM_params = calculate_intensity_measures(results.acc_filtered, results.vel, ...
                                                 results.disp, dt, PSV, periods);
        
        % 6. 保存单个文件结果
        [~, base_name, ~] = fileparts(filename);
        output_prefix = fullfile(config.output_folder, base_name);
        
        % 保存加速度时程
        acc_data = [results.time, results.acc_filtered];
        writematrix(acc_data, [output_prefix, '_filtered_acc.txt'], 'Delimiter', '\t');
        
        % 保存速度时程
        vel_data = [results.time, results.vel];
        writematrix(vel_data, [output_prefix, '_velocity.txt'], 'Delimiter', '\t');
        
        % 保存位移时程
        disp_data = [results.time, results.disp];
        writematrix(disp_data, [output_prefix, '_displacement.txt'], 'Delimiter', '\t');
        
        % 保存PSV
        psv_data = [periods, PSV];
        writematrix(psv_data, [output_prefix, '_PSV.txt'], 'Delimiter', '\t');
        
        % 保存强度参数
        fid = fopen([output_prefix, '_IM_params.txt'], 'w');
        fprintf(fid, '文件: %s\n', filename);
        fprintf(fid, '测站: %s\n', header.station_code);
        fprintf(fid, '==================\n');
        fprintf(fid, 'PGA = %.3f cm/s^2 (%.4f g)\n', IM_params.PGA, IM_params.PGA/981);
        fprintf(fid, 'PGV = %.3f cm/s\n', IM_params.PGV);
        fprintf(fid, 'PGD = %.3f cm\n', IM_params.PGD);
        fprintf(fid, 'CAV = %.3f g-sec\n', IM_params.CAV);
        fprintf(fid, 'Arias Intensity = %.3f cm/s\n', IM_params.Ia);
        fprintf(fid, '有效持时 = %.2f s\n', IM_params.D_5_95);
        fprintf(fid, 'RMS加速度 = %.3f cm/s^2\n', IM_params.RMS_acc);
        fprintf(fid, '谱强度 SI = %.3f cm\n', IM_params.SI);
        fprintf(fid, '房屋破坏指数 HI = %.3f cm\n', IM_params.HI);
        fprintf(fid, '特征周期 Tc = %.3f s\n', IM_params.Tc);
        fprintf(fid, '平均周期 Tm = %.3f s\n', IM_params.Tm);
        fprintf(fid, 'PGV/PGA = %.4f s\n', IM_params.PGV_PGA_ratio);
        fclose(fid);
        
        % 7. 绘图
        fig = figure('Visible', 'off', 'Position', [100, 100, 1200, 800]);
        
        subplot(4,1,1)
        plot(results.time, results.acc_filtered, 'b', 'LineWidth', 1);
        xlabel('时间 (s)'); ylabel('加速度 (cm/s^2)');
        title(['加速度时程 - ', filename], 'Interpreter', 'none');
        grid on;
        
        subplot(4,1,2)
        plot(results.time, results.vel, 'r', 'LineWidth', 1);
        xlabel('时间 (s)'); ylabel('速度 (cm/s)');
        title('速度时程'); grid on;
        
        subplot(4,1,3)
        plot(results.time, results.disp, 'g', 'LineWidth', 1);
        xlabel('时间 (s)'); ylabel('位移 (cm)');
        title('位移时程'); grid on;
        
        subplot(4,1,4)
        loglog(periods, PSV, 'b', 'LineWidth', 2);
        xlabel('周期 (s)'); ylabel('PSV (cm/s)');
        title(sprintf('伪速度反应谱 (ζ = %.1f%%)', config.damping_ratio*100));
        grid on; xlim([0.01 100]);
        
        saveas(fig, [output_prefix, '_summary.png']);
        close(fig);
        
        % 8. 添加到汇总表
        row_data = struct();
        row_data.Filename = {filename};
        row_data.Station = {header.station_code};
        row_data.PGA_gal = IM_params.PGA;
        row_data.PGA_g = IM_params.PGA/981;
        row_data.PGV_cm_s = IM_params.PGV;
        row_data.PGD_cm = IM_params.PGD;
        row_data.CAV_g_sec = IM_params.CAV;
        row_data.Ia_cm_s = IM_params.Ia;
        row_data.Duration_s = IM_params.D_5_95;
        row_data.RMS_acc = IM_params.RMS_acc;
        row_data.SI_cm = IM_params.SI;
        row_data.HI_cm = IM_params.HI;
        row_data.Tc_s = IM_params.Tc;
        row_data.Tm_s = IM_params.Tm;
        row_data.PGV_PGA_ratio = IM_params.PGV_PGA_ratio;
        
        summary_table = [summary_table; struct2table(row_data)]; %#ok<AGROW>
        
        fprintf('文件处理成功!\n\n');
        
    catch ME
        fprintf('错误: 处理文件 %s 时出错\n', filename);
        fprintf('错误信息: %s\n\n', ME.message);
        continue;
    end
end

%% 保存汇总结果
fprintf('保存汇总结果...\n');
writetable(summary_table, fullfile(config.output_folder, 'summary_results.csv'));
writetable(summary_table, fullfile(config.output_folder, 'summary_results.xlsx'));

%% 生成汇总报告
fid = fopen(fullfile(config.output_folder, 'processing_report.txt'), 'w');
fprintf(fid, '地震动批量处理报告\n');
fprintf(fid, '==================\n\n');
fprintf(fid, '处理日期: %s\n', datestr(now));
fprintf(fid, '处理文件数: %d\n', height(summary_table));
fprintf(fid, '成功处理: %d\n', height(summary_table));
fprintf(fid, '\n参数设置:\n');
fprintf(fid, '  高通滤波频率: %.2f Hz\n', config.highcut_freq);
fprintf(fid, '  低通滤波频率: %.2f Hz\n', config.lowcut_freq);
fprintf(fid, '  滤波器阶数: %d\n', config.filter_order);
fprintf(fid, '  滤波类型: %s\n', config.use_acausal ? '非因果' : '因果');
fprintf(fid, '  基线校正: %s\n', config.baseline_method);
fprintf(fid, '  阻尼比: %.1f%%\n', config.damping_ratio*100);
fprintf(fid, '\n统计结果:\n');
fprintf(fid, '  PGA范围: %.3f - %.3f cm/s^2\n', min(summary_table.PGA_gal), max(summary_table.PGA_gal));
fprintf(fid, '  PGV范围: %.3f - %.3f cm/s\n', min(summary_table.PGV_cm_s), max(summary_table.PGV_cm_s));
fprintf(fid, '  PGD范围: %.3f - %.3f cm\n', min(summary_table.PGD_cm), max(summary_table.PGD_cm));
fclose(fid);

fprintf('\n===== 批量处理完成! =====\n');
fprintf('结果保存在: %s\n', config.output_folder);
fprintf('处理成功: %d / %d 个文件\n', height(summary_table), n_files);
