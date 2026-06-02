clc;clear;close all;

% 403 左臂

i = 403;
msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',i);
load(msg);
result_final = result;

for j = 401:404
    if j ~= i
        msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',j);
        load(msg);
        result_final = merge_pareto_incremental_2(result_final, result);
    end
end

for j = 1:54
    if j ~= i
        msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',j);
        load(msg);
        result_final = merge_pareto_incremental_2(result_final, result);
    end
end

for j = 101:125
    if j ~= i
        msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',j);
        load(msg);
        result_final = merge_pareto_incremental_2(result_final, result);
    end
end

for j = 201:230
    if j ~= i
        msg = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat',j);
        load(msg);
        result_final = merge_pareto_incremental_2(result_final, result);
    end
end

plot_pareto_smooth_2(result_final.fval)