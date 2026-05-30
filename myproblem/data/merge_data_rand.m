function merge_data_rand(start_idx, end_idx, case_name)

% 创建保存文件夹
dataFolder = fullfile(pwd, ['data ' case_name]);
if ~exist(dataFolder, 'dir')
    mkdir(dataFolder);
end

% 生成 start_idx 到 end_idx 的随机顺序
randomOrder = randperm(end_idx - start_idx + 1) + start_idx - 1;

for i = randomOrder
    filePath = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat', i);
    S = load(filePath);
    result_final = S.result;

    for j = start_idx:end_idx
        if j ~= i
            filePath = sprintf('F:\\Archive 归档\\0528\\myproblem\\data\\result_run_%d.mat', j);
            Q = load(filePath);
            result_j = Q.result;
            result_final = merge_pareto_incremental_2(result_final, result_j);
        end
    end

    saveFile = fullfile(dataFolder, sprintf('%d %d %d.mat', i, start_idx, end_idx));
    save(saveFile, 'result_final');
end

end