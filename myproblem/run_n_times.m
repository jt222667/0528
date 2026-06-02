clc; clear;

%% --------- 配置参数 ----------
opts = struct();
opts.PopulationSize = 100;
opts.MaxGenerations = 10;
opts.UseParallel = true;

% 任务1目标点：装配
% POS_e1 = [1.8 0 1.8]';
% ORI_e1 = cy(pi/2);

% % 任务2目标点：爬行 10 + 10
% T2_1 = [cx(-2*pi/3) [0;0;0]; 0 0 0 1];
% T2_2 = [cx(pi) [0;-2;-2]; 0 0 0 1];
% T2 = T2_1 * T2_2;
% POS_e2 = T2(1:3,4);
% ORI_e2 = T2(1:3,1:3);
% 
% % 任务3目标点：爬行 10 + 10 + 10
% T3 = [cy(pi) [1.5;0;0.5];0 0 0 1];
% POS_e3 = T3(1:3,4);
% ORI_e3 = T3(1:3,1:3);


% 任务4目标点：
R4 = [-1 0 0;0 0 1;0 1 0];
P4 = [1;-1;-1];
T4_1 = [R4,P4;0 0 0 1];
T4_2 = [cx(-2*pi/3) [0;0;0]; 0 0 0 1];
T4 = T4_2 * T4_1 ;
POS_e4 = T4(1:3,4);
ORI_e4 = T4(1:3,1:3);


%% 使用绝对路径
dataFolder = fullfile(pwd, 'data');  
if ~exist(dataFolder, 'dir')
    mkdir(dataFolder);
end

%% --------- 目标点1 ----------
% opts.tar.POS_e = POS_e1;
% opts.tar.ORI_e = ORI_e1;
% start_t = 301
% end_t   = 400
% for runIdx = start_t:end_t
%     fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
%     result = solve_MOEA_robot(opts);
%     saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
%     save(saveFile, 'result');
% end
% disp('All runs completed and saved in the data folder.');

% %% --------- 目标点2 ----------
% opts.tar.POS_e = POS_e2;
% opts.tar.ORI_e = ORI_e2;
% start_t = 121
% end_t   = 150
% for runIdx = start_t:end_t
%     fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
%     result = solve_MOEA_robot(opts);
%     saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
%     save(saveFile, 'result');
% end
% disp('All runs completed and saved in the data folder.');
% 
% %% --------- 目标点3 ----------
% opts.tar.POS_e = POS_e3;
% opts.tar.ORI_e = ORI_e3;
% start_t = 201
% end_t   = 230
% for runIdx = start_t:end_t
%     fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
%     result = solve_MOEA_robot(opts);
%     saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
%     save(saveFile, 'result');
% end
% disp('All runs completed and saved in the data folder.');

%% --------- 目标点4 ----------
opts.tar.POS_e = POS_e4;
opts.tar.ORI_e = ORI_e4;
start_t = 404
end_t   = 500
for runIdx = start_t:end_t
    fprintf('Running iteration %d / %d...\n', runIdx - start_t + 1, end_t - start_t + 1);
    result = solve_MOEA_robot(opts);
    saveFile = fullfile(dataFolder, sprintf('result_run_%d.mat', runIdx));
    save(saveFile, 'result');
end
disp('All runs completed and saved in the data folder.');