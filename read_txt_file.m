function [acc, dt, header] = read_txt_file(filename)
% READ_TXT_FILE 读取两列TXT格式的地震动数据
% 文件格式：第一列时间(s)，第二列加速度(cm/s^2)
% 自动检测并跳过表头行
%
% 输入:
%   filename - TXT文件路径
% 输出:
%   acc - 加速度时程 (cm/s^2)
%   dt - 时间间隔 (s)，从时间列自动计算
%   header - 结构体，包含文件信息

    fid = fopen(filename, 'r');
    if fid == -1
        error('无法打开文件: %s', filename);
    end
    
    % 初始化
    time_data = [];
    acc_data = [];
    header_lines = {};
    header_line_count = 0;
    
    % 逐行读取，自动检测表头
    line_num = 0;
    while ~feof(fid)
        line = fgetl(fid);
        line_num = line_num + 1;
        
        if ~ischar(line)
            continue;
        end
        
        % 去除首尾空格
        line = strtrim(line);
        
        % 跳过空行
        if isempty(line)
            continue;
        end
        
        % 尝试解析为数值
        values = str2num(line); %#ok<ST2NM>
        
        if isempty(values)
            % 无法解析为数值，认为是表头
            header_lines{end+1} = line; %#ok<AGROW>
            header_line_count = header_line_count + 1;
        elseif length(values) >= 2
            % 成功解析为数值，认为是数据行
            time_data(end+1) = values(1); %#ok<AGROW>
            acc_data(end+1) = values(2); %#ok<AGROW>
        else
            % 只有一列数据，警告用户
            warning('第 %d 行数据格式异常（只有一列）: %s', line_num, line);
        end
    end
    fclose(fid);
    
    % 检查数据是否有效
    if isempty(time_data) || isempty(acc_data)
        error('无法从文件中读取有效数据: %s', filename);
    end
    
    % 转换为列向量
    time_data = time_data(:);
    acc = acc_data(:);
    
    % 计算时间步长dt（从时间列的差值）
    time_diff = diff(time_data);
    dt = mean(time_diff);
    
    % 检查时间步长的一致性
    dt_std = std(time_diff);
    if dt_std / dt > 0.01  % 如果标准差超过1%，发出警告
        warning('时间步长不均匀，标准差 = %.4f s (%.2f%%)，将使用平均值 dt = %.4f s', ...
                dt_std, dt_std/dt*100, dt);
    end
    
    % 构建头信息结构体
    header = struct();
    header.format = 'TXT';  % 标记文件格式
    header.component = 'Unknown';  % TXT文件通常不指定分量
    header.sampling_freq = 1.0 / dt;
    header.duration = time_data(end) - time_data(1);
    header.num_points = length(acc);
    header.header_lines = header_lines;
    header.header_line_count = header_line_count;
    
    % 提取站名（使用文件名作为站名）
    [~, base_name, ~] = fileparts(filename);
    header.station_code = base_name;
    
    % 输出读取信息
    fprintf('成功读取文件: %s\n', filename);
    fprintf('文件格式: TXT两列格式\n');
    if header_line_count > 0
        fprintf('检测到 %d 行表头\n', header_line_count);
    end
    fprintf('采样率: %.2f Hz, 时间间隔: %.4f s\n', header.sampling_freq, dt);
    fprintf('数据点数: %d, 持续时间: %.2f s\n', length(acc), header.duration);
    fprintf('最大加速度: %.3f cm/s^2\n', max(abs(acc)));
end
