function [acc, dt, header] = read_ew_file(filename)
% READ_EW_FILE 读取日本格式的EW强震动记录文件
% 
% *** 此函数已废弃，请使用 read_knet_file.m 或 read_ground_motion.m ***
%
% 为保持向后兼容，此函数内部调用 read_knet_file
% 
% 输入:
%   filename - EW文件路径
% 输出:
%   acc - 加速度时程 (cm/s^2)
%   dt - 时间间隔 (s)
%   header - 结构体，包含文件头信息
%
% 另请参阅: read_knet_file, read_ground_motion

    warning('read_ew_file 已废弃，请使用 read_knet_file 或 read_ground_motion');
    [acc, dt, header] = read_knet_file(filename);
end
