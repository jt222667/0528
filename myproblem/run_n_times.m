clc; clear;

% --------- 配置参数 ----------
opts = struct();
opts.PopulationSize = 300;
opts.MaxGenerations = 20;
opts.UseParallel = true;

% 任务1目标点：装配
POS_e1 = [2 0 2]';
ORI_e1 = cy(pi);

% 任务2目标点：爬行 10 + 10
T2_1 = [cx(-2*pi/3) [0;0;0]; 0 0 0 1];
T2_2 = [cx(pi) [0;-2;-2]; 0 0 0 1];
T2 = T2_1 * T2_2;
POS_e2 = T2(1:3,4);
ORI_e2 = T2(1:3,1:3);

% 任务3目标点：爬行 10 + 10 + 10
T3 = [cy(pi) [1.5;0;0.5];0 0 0 1];
POS_e3 = T3(1:3,4);
ORI_e3 = T3(1:3,1:3);

% 使用绝对路径
dataFolder = fullfile(pwd, 'data');  
% 创建文件夹（如果不存在）
if ~exist(dataFolder, 'dir')
    mkdir(dataFolder);
end

%% --------- 目标点1 ----------
% opts.tar.POS_e = POS_e1;
% opts.tar.ORI_e = ORI_e1;
% start_t = 40
% end_t   = 100
% for runIdx = start_t:end_t
%     fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
%     result = solve_MOEA_robot(opts);
%     saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
%     save(saveFile, 'result');
% end
% disp('All runs completed and saved in the data folder.');

%% --------- 目标点2 ----------
opts.tar.POS_e = POS_e2;
opts.tar.ORI_e = ORI_e2;
start_t = 121
end_t   = 150
for runIdx = start_t:end_t
    fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
    result = solve_MOEA_robot(opts);
    saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
    save(saveFile, 'result');
end
disp('All runs completed and saved in the data folder.');

%% --------- 目标点3 ----------
opts.tar.POS_e = POS_e3;
opts.tar.ORI_e = ORI_e3;
start_t = 201
end_t   = 230
for runIdx = start_t:end_t
    fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
    result = solve_MOEA_robot(opts);
    saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
    save(saveFile, 'result');
end
disp('All runs completed and saved in the data folder.');