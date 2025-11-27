function [IM_params] = calculate_intensity_measures(acc, vel, disp, dt, PSV, periods)
% CALCULATE_INTENSITY_MEASURES 计算地震动强度参数(IM)
%
% 输入:
%   acc - 加速度时程 (cm/s^2)
%   vel - 速度时程 (cm/s)
%   disp - 位移时程 (cm)
%   dt - 时间步长 (s)
%   PSV - 伪速度反应谱 (cm/s)
%   periods - 周期向量 (s)
%
% 输出:
%   IM_params - 强度参数结构体

    time = (0:length(acc)-1)' * dt;
    
    % 基本强度参数
    IM_params.PGA = max(abs(acc));  % 峰值加速度
    IM_params.PGV = max(abs(vel));  % 峰值速度
    IM_params.PGD = max(abs(disp));  % 峰值位移
    
    % CAV (Cumulative Absolute Velocity) - 重要的破坏潜力指标
    IM_params.CAV = trapz(time, abs(acc)) / 981;  % g-sec
    
    % Arias Intensity (Ia) - 地震能量指标
    % Ia = π/(2g) * ∫[a(t)]^2 dt
    IM_params.Ia = pi / (2*981) * trapz(time, acc.^2);  % cm/s
    
    % 有效持时 (根据Arias Intensity计算)
    % 5%-95% Arias Intensity之间的时间
    cumulative_Ia = cumtrapz(time, acc.^2);
    cumulative_Ia = cumulative_Ia / cumulative_Ia(end);  % 归一化
    idx_5 = find(cumulative_Ia >= 0.05, 1, 'first');
    idx_95 = find(cumulative_Ia >= 0.95, 1, 'first');
    if ~isempty(idx_5) && ~isempty(idx_95)
        IM_params.D_5_95 = time(idx_95) - time(idx_5);
    else
        IM_params.D_5_95 = NaN;
    end
    
    % 均方根加速度 (RMS)
    IM_params.RMS_acc = sqrt(mean(acc.^2));
    
    % 谱强度 (SI) - 速度反应谱在0.1-2.5秒的积分
    idx_si = (periods >= 0.1) & (periods <= 2.5);
    if any(idx_si)
        IM_params.SI = trapz(periods(idx_si), PSV(idx_si));
    else
        IM_params.SI = NaN;
    end
    
    % 房屋破坏指数 (HI) - 速度反应谱在0.1-0.5秒的积分
    idx_hi = (periods >= 0.1) & (periods <= 0.5);
    if any(idx_hi)
        IM_params.HI = trapz(periods(idx_hi), PSV(idx_hi));
    else
        IM_params.HI = NaN;
    end
    
    % 特征周期 (Tc) - PSV峰值对应的周期
    [~, idx_peak] = max(PSV);
    IM_params.Tc = periods(idx_peak);
    
    % 平均周期 (Tm)
    % Tm = 2π * √(m0/m2)，其中m0和m2是谱矩
    fs = 1/dt;
    [psd, freq] = pwelch(acc, [], [], [], fs);
    m0 = trapz(freq, psd);
    m2 = trapz(freq, freq.^2 .* psd);
    if m2 > 0 && m0 > 0
        IM_params.Tm = 2*pi * sqrt(m0/m2);
    else
        IM_params.Tm = NaN;
    end
    
    % PGV/PGA比值（cm*s^-1 / cm*s^-2 = s）
    IM_params.PGV_PGA_ratio = IM_params.PGV / IM_params.PGA;
    
    % 加速度谱强度 (ASI) - 加速度反应谱在0.1-0.5秒的积分
    % 需要计算Sa (这里用PSV*omega近似)
    omega_range = 2*pi./periods;
    Sa_approx = PSV .* omega_range;
    idx_asi = (periods >= 0.1) & (periods <= 0.5);
    if any(idx_asi)
        IM_params.ASI = trapz(periods(idx_asi), Sa_approx(idx_asi));
    else
        IM_params.ASI = NaN;
    end
    
    % 输出结果摘要
    fprintf('\n=== 地震动强度参数 ===\n');
    fprintf('PGA = %.3f cm/s^2 (%.4f g)\n', IM_params.PGA, IM_params.PGA/981);
    fprintf('PGV = %.3f cm/s\n', IM_params.PGV);
    fprintf('PGD = %.3f cm\n', IM_params.PGD);
    fprintf('CAV = %.3f g-sec\n', IM_params.CAV);
    fprintf('Arias Intensity = %.3f cm/s\n', IM_params.Ia);
    fprintf('有效持时 (5-95%%) = %.2f s\n', IM_params.D_5_95);
    fprintf('RMS加速度 = %.3f cm/s^2\n', IM_params.RMS_acc);
    fprintf('谱强度 SI = %.3f cm\n', IM_params.SI);
    fprintf('房屋破坏指数 HI = %.3f cm\n', IM_params.HI);
    fprintf('特征周期 Tc = %.3f s\n', IM_params.Tc);
    fprintf('平均周期 Tm = %.3f s\n', IM_params.Tm);
    fprintf('PGV/PGA = %.4f s\n', IM_params.PGV_PGA_ratio);
    fprintf('======================\n\n');
end
