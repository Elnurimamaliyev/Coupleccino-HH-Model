# Data Directory

Place your experimental `.mat` files in the `real_cells/` subdirectory.

## Expected Data Format

Data files should contain cell recording matrices with the following structure:

### Variables
- `pre_cell_15` - Pre-synaptic control responses (15 trials)
- `post_cell_15` - Post-synaptic control responses (15 trials)
- `pre_cell_pharma_XX` - Pre-synaptic pharmacological responses
- `post_cell_pharma_XX` - Post-synaptic pharmacological responses

### Data Shape
Each variable should be a 2D matrix:
- **Rows**: Different trials/conditions
- **Columns**: Time points (sampling at 0.1 ms bins)

### Example Files
- `20240628-B-M-3.mat`
- `20240701-B-M-1.mat`
- `20240701-S-A-1.mat`
- `20240701-B-M-2.mat`

## Usage

Load data in your scripts:
```matlab
% After running setup_paths.m
dataFile = '20240628-B-M-3.mat';
load(fullfile('data', 'real_cells', dataFile));

% Access the data
preCellData = pre_cell_15(7, :);  % Trial 7
postCellData = post_cell_15(7, :);
```

## Note
`.mat` files are typically excluded from git due to size. Keep backups elsewhere.
