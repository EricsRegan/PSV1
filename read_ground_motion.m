function [acc, dt, header] = read_ground_motion(filename)
% READ_GROUND_MOTION 统一地震动数据读取函数
% 自动识别文件格式并调用相应的读取函数
%
% 支持的文件格式:
%   1. 日本K-NET/KiK-net格式: .EW, .NS, .UD （三个分量格式结构相同）
%   2. TXT两列格式: .txt （第一列时间，第二列加速度）
%
% 输入:
%   filename - 地震动文件路径
% 输出:
%   acc - 加速度时程 (cm/s^2)
%   dt - 时间间隔 (s)
%   header - 结构体，包含文件头信息
%       .format - 文件格式 ('KNET' 或 'TXT')
%       .component - 分量类型 (EW/NS/UD 或 Unknown)
%       .sampling_freq - 采样频率 (Hz)
%       .station_code - 测站代码
%       .duration - 持续时间 (s)
%       以及其他格式特有的信息

    % 检查文件是否存在
    if ~exist(filename, 'file')
        error('文件不存在: %s', filename);
    end
    
    % 获取文件扩展名
    [~, ~, ext] = fileparts(filename);
    ext_upper = upper(ext);
    
    % 根据扩展名选择读取函数
    switch ext_upper
        case {'.EW', '.NS', '.UD'}
            % 日本K-NET/KiK-net格式
            fprintf('检测到K-NET/KiK-net格式文件 (%s)\n', ext);
            [acc, dt, header] = read_knet_file(filename);
            
        case '.TXT'
            % TXT两列格式
            fprintf('检测到TXT格式文件\n');
            [acc, dt, header] = read_txt_file(filename);
            
        otherwise
            % 不支持的格式，尝试作为TXT读取
            warning('未知文件格式 (%s)，尝试作为TXT格式读取...', ext);
            try
                [acc, dt, header] = read_txt_file(filename);
            catch ME
                error('无法识别文件格式: %s\n错误信息: %s', filename, ME.message);
            end
    end
    
    % 确保输出格式统一
    acc = acc(:);  % 确保是列向量
    
    % 验证数据有效性
    if isempty(acc)
        error('读取到空数据: %s', filename);
    end
    
    if dt <= 0
        error('无效的时间步长 dt = %.4f: %s', dt, filename);
    end
    
    fprintf('------\n');
end
