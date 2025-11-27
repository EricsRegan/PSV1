function [PSV, periods] = calculate_response_spectrum(acc, dt, damping_ratio, period_range)
% CALCULATE_RESPONSE_SPECTRUM 计算伪速度反应谱(PSV)
%
% 输入:
%   acc - 加速度时程 (cm/s^2)
%   dt - 时间步长 (s)
%   damping_ratio - 阻尼比，默认0.05 (5%)
%   period_range - 周期范围 [T_min, T_max, num_points]，默认[0.02, 50, 1000]
%
% 输出:
%   PSV - 伪速度反应谱 (cm/s)
%   periods - 周期向量 (s)

    if nargin < 3 || isempty(damping_ratio)
        damping_ratio = 0.05;
    end
    
    if nargin < 4 || isempty(period_range)
        % 默认周期范围：0.02秒到50秒，1000个点（对数分布）
        period_range = [0.02, 50, 1000];
    end
    
    % 生成周期向量（对数分布更合理）
    periods = logspace(log10(period_range(1)), log10(period_range(2)), period_range(3))';
    
    % 初始化PSV数组
    PSV = zeros(length(periods), 1);
    
    fprintf('计算反应谱 (阻尼比 = %.1f%%)...\n', damping_ratio*100);
    
    % 对每个周期计算最大反应
    for i = 1:length(periods)
        T = periods(i);
        omega_n = 2*pi/T;  % 自然圆频率
        
        % 使用Newmark-beta方法计算单自由度系统响应
        [~, vel_rel, ~] = newmark_beta_sdof(acc, dt, omega_n, damping_ratio);
        
        % PSV = 最大相对速度
        PSV(i) = max(abs(vel_rel));
        
        % 显示进度
        if mod(i, 100) == 0
            fprintf('进度: %d/%d (%.1f%%)\n', i, length(periods), i/length(periods)*100);
        end
    end
    
    fprintf('反应谱计算完成!\n');
end

function [disp_rel, vel_rel, acc_abs] = newmark_beta_sdof(acc_ground, dt, omega_n, zeta)
% NEWMARK_BETA_SDOF 使用Newmark-Beta方法求解单自由度系统响应
% 
% 输入:
%   acc_ground - 地面加速度 (cm/s^2)
%   dt - 时间步长 (s)
%   omega_n - 自然圆频率 (rad/s)
%   zeta - 阻尼比
%
% 输出:
%   disp_rel - 相对位移 (cm)
%   vel_rel - 相对速度 (cm/s)
%   acc_abs - 绝对加速度 (cm/s^2)

    % Newmark-Beta参数（平均加速度法）
    gamma = 0.5;
    beta = 0.25;
    
    % 系统参数
    m = 1;  % 质量（归一化）
    k = m * omega_n^2;  % 刚度
    c = 2 * m * omega_n * zeta;  % 阻尼
    
    % 初始化
    n = length(acc_ground);
    disp_rel = zeros(n, 1);
    vel_rel = zeros(n, 1);
    acc_rel = zeros(n, 1);
    
    % 初始条件（静止）
    disp_rel(1) = 0;
    vel_rel(1) = 0;
    acc_rel(1) = -acc_ground(1);
    
    % 计算有效刚度
    k_eff = k + gamma/(beta*dt)*c + 1/(beta*dt^2)*m;
    
    % 常数
    a = m/(beta*dt) + gamma*c/beta;
    b = m/(2*beta) + dt*c*(gamma/(2*beta) - 1);
    
    % 时间步进
    for i = 1:n-1
        % 有效力
        dp = -m*(acc_ground(i+1) - acc_ground(i));
        dF_eff = dp + a*vel_rel(i) + b*acc_rel(i);
        
        % 增量位移
        ddisp = dF_eff / k_eff;
        
        % 增量速度
        dvel = gamma/(beta*dt)*ddisp - gamma/beta*vel_rel(i) + ...
               dt*(1 - gamma/(2*beta))*acc_rel(i);
        
        % 更新状态变量
        disp_rel(i+1) = disp_rel(i) + ddisp;
        vel_rel(i+1) = vel_rel(i) + dvel;
        
        % 更新加速度（运动方程）
        acc_rel(i+1) = (-c*vel_rel(i+1) - k*disp_rel(i+1)) / m;
    end
    
    % 绝对加速度
    acc_abs = acc_rel + acc_ground;
end
