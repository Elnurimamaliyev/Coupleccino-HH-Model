%% Setup Paths for Coupleccino-HH-Model
% Automatically configures MATLAB paths for the project
% Run this script once at the start of each session
%
% Author: Elnur Imamaliyev
% Date: December 2024

%% Get the project root directory
projectRoot = fileparts(fileparts(mfilename('fullpath')));

%% Add all source directories to path
addpath(fullfile(projectRoot, 'src', 'models'));
addpath(fullfile(projectRoot, 'src', 'analysis'));
addpath(fullfile(projectRoot, 'src', 'data_processing'));
addpath(fullfile(projectRoot, 'src', 'config'));

%% Add data directory
addpath(fullfile(projectRoot, 'data', 'real_cells'));

%% Add experiments directory
addpath(fullfile(projectRoot, 'experiments'));

%% Display confirmation
fprintf('✓ Coupleccino-HH-Model paths configured successfully!\n');
fprintf('  Project root: %s\n', projectRoot);
fprintf('\nAvailable directories:\n');
fprintf('  - src/models/          : Core simulation models\n');
fprintf('  - src/analysis/        : Spike detection and analysis\n');
fprintf('  - src/data_processing/ : Real cell data utilities\n');
fprintf('  - data/real_cells/     : Experimental recordings\n');
fprintf('  - experiments/         : Test scripts\n');
fprintf('\nYou can now run simulations from any directory!\n');
