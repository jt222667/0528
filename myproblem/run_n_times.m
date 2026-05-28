clc; clear;

% --------- 配置参数 ----------
opts = struct();
opts.PopulationSize = 100;
opts.MaxGenerations = 100;
opts.UseParallel = true;

% 可选：自定义目标点
opts.tar.POS_e = [2 0 2]';
opts.tar.ORI_e = cy(pi);

start_t = 1
end_t   = 10

dataFolder = fullfile(pwd, 'data');  % 使用绝对路径

% 创建文件夹（如果不存在）
if ~exist(dataFolder, 'dir')
    mkdir(dataFolder);
end

% --------- 循环运行 ----------
for runIdx = start_t:end_t

    fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t);

    result = solve_MOEA_robot(opts);

    % 保存每次运行结果
    saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
    save(saveFile, 'result');

end

disp('All runs completed and saved in the data folder.');
