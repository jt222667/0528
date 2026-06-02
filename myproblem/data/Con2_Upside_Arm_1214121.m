clc;clear;close all;
% 204 208 220

i = 208;

msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',i);
load(msg);
result_final = result;

for j = 201:230
    if j ~= i
        msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',j);
        load(msg);
        result_final = merge_pareto_incremental_2(result_final, result);
    end
end

result_final.fval(result_final.fval(:,3) == 19, :) = [];
result_final.x(result_final.fval(:,3) == 19, :) = [];

plot_pareto_smooth_2(result_final.fval)