function [acc, dt, header] = read_knet_file(filename)
% READ_KNET_FILE 读取日本K-NET/KiK-net格式的强震动记录文件
% 支持的文件格式: .EW（东西向）、.NS（南北向）、.UD（上下向）
% 这三种格式的文件结构完全相同，只是分量不同
%
% 输入:
%   filename - 地震动文件路径 (.EW, .NS, .UD)
% 输出:
%   acc - 加速度时程 (cm/s^2)
%   dt - 时间间隔 (s)
%   header - 结构体，包含文件头信息

    fid = fopen(filename, 'r');
    if fid == -1
        error('无法打开文件: %s', filename);
    end
    
    % 初始化头信息结构
    header = struct();
    header.format = 'KNET';  % 标记文件格式
    
    % 获取文件扩展名，确定分量类型
    [~, ~, ext] = fileparts(filename);
    ext_upper = upper(ext);
    switch ext_upper
        case '.EW'
            header.component = 'EW';  % 东西向分量
        case '.NS'
            header.component = 'NS';  % 南北向分量
        case '.UD'
            header.component = 'UD';  % 上下向分量
        otherwise
            header.component = 'Unknown';
    end
    
    % 读取头文件信息
    line_count = 0;
    while line_count < 17  % 前17行是头文件
        line = fgetl(fid);
        line_count = line_count + 1;
        
        if contains(line, 'Sampling Freq')
            % 提取采样频率
            parts = strsplit(line);
            freq_str = parts{end};
            header.sampling_freq = str2double(strrep(freq_str, 'Hz', ''));
            dt = 1.0 / header.sampling_freq;
        elseif contains(line, 'Duration Time')
            % 提取持续时间
            parts = strsplit(line);
            header.duration = str2double(parts{end});
        elseif contains(line, 'Scale Factor')
            % 提取比例因子: 2000(gal)/6182761
            parts = strsplit(line);
            scale_parts = strsplit(parts{end}, '/');
            numerator = str2double(strrep(scale_parts{1}, '(gal)', ''));
            denominator = str2double(scale_parts{2});
            header.scale_factor = numerator / denominator;
        elseif contains(line, 'Max. Acc.')
            parts = strsplit(line);
            header.max_acc = str2double(parts{end});
        elseif contains(line, 'Origin Time')
            header.origin_time = strtrim(line(20:end));
        elseif contains(line, 'Station Code')
            header.station_code = strtrim(line(20:end));
        end
    end
    
    % 读取加速度计数数据
    acc_counts = [];
    while ~feof(fid)
        line = fgetl(fid);
        if ischar(line)
            % 解析每行的数值
            values = str2num(line); %#ok<ST2NM>
            acc_counts = [acc_counts; values(:)]; %#ok<AGROW>
        end
    end
    fclose(fid);
    
    % 转换为加速度值 (gal = cm/s^2)
    acc = acc_counts * header.scale_factor;
    
    fprintf('成功读取文件: %s\n', filename);
    fprintf('文件格式: K-NET/KiK-net (%s分量)\n', header.component);
    fprintf('采样率: %.0f Hz, 时间间隔: %.4f s\n', header.sampling_freq, dt);
    fprintf('数据点数: %d, 持续时间: %.1f s\n', length(acc), length(acc)*dt);
    fprintf('最大加速度: %.3f gal\n', max(abs(acc)));
end
