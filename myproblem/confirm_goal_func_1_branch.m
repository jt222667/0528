%% 验证机器人单分支构型各项指标求解函数
clc;
clear;

%% 目标点设置

% 目标点1：装配
% tar.POS_e = [2 0 2]';
% tar.ORI_e = cy(pi);

% 目标点2：爬行
% T2 = [cx(-2*pi/3) [0;0;0];0 0 0 1]*[cx(pi) [0;-2;-2];0 0 0 1];
% tar.POS_e = T2(1:3,4);
% tar.ORI_e = T2(1:3,1:3);

% 目标点3：抓取
T3 = [cy(pi) [1.5;0;0.5];0 0 0 1];
tar.POS_e = T3(1:3,4);
tar.ORI_e = T3(1:3,1:3);

%% 模块库初始化
RP_data = Module_Lib();

%% 决策变量生成
[n, module_raw, install_raw, align_raw, sequence_raw] = generate_valid_config_x(RP_data);

[module_out, install_out, align_out, sequence_out, num_exp, is_valid, ~] = expand_module_units(module_raw(1:n),install_raw(1:n),align_raw(1:n),sequence_raw(1:n),RP_data);

%% 机器人初始化
LP = LP_generate(module_out, install_out, align_out, sequence_out, RP_data);

% mq = [1 2 1 2 1 2 1];iq = [1 1 1 1 1 1 1];aq = [0 0 0 0 0 0 0];sq = [0 1 2 3 4 5 6];
% LP = LP_generate(mq, iq, aq, sq, RP_data);

SV = SV_generate(LP);

%% 目标点初始化
Goal = Goal_init(SV);
Goal.change = [1 0 0];
Goal.POS_e{1} = tar.POS_e;
Goal.ORI_e{1} = tar.ORI_e;

%% 求优化目标1：机器人末端最大可操作度
[SV_goal, flag_goal, q_goal, w_goal] =  SQP_all(LP, SV, Goal);

%% 求优化目标2：机器人末端最大定位误差
sig_goal = calc_sig_worst_all(SV_goal, LP);

%% 求优化目标3：机器人原始模块数+展开后模块数
num_goal = num_exp + n;

PlotSV(LP,SV_goal);

