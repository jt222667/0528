clc; clear;

opts = struct();
opts.PopulationSize = 100;
opts.MaxGenerations = 10;
opts.UseParallel = true;

% 可选：自定义目标点
% opts.tar.POS_e = [0.8 0.1 0.3]';
% opts.tar.ORI_e = cy(pi/3);

tic;
result = solve_MOEA_robot(opts);
toc;

plot_pareto(result.fval)

plot_pareto_smooth(result.fval)