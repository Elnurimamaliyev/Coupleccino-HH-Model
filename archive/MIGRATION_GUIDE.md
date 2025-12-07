# Project Restructuring Guide

## Overview
This guide explains how to migrate your files from the old structure to the new organized structure.

## Why Restructure?
1. **Clear organization** - Separate models, analysis, data, and experiments
2. **Better version control** - Archive old versions properly
3. **Portable paths** - No more hardcoded Windows paths on macOS
4. **Easy collaboration** - Standard directory structure
5. **Scalability** - Easy to add new experiments and models

## Migration Steps

### Step 1: Copy Analysis Functions (Safe - No Risk)
```bash
# Copy analysis functions to new location
cp Model/Functions/SpikeDetection2.m src/analysis/
cp Model/Functions/SpikeCount.m src/analysis/
```

### Step 2: Copy Main Models
```bash
# Copy main simulation files
cp Model/Coupleccino_Only_param.m src/models/single_cell_simulation.m
cp Model/RzDoubleCoupleccino_Elnur.m src/models/coupled_cells_simulation.m
cp Model/plot_real.m src/data_processing/
```

### Step 3: Archive Parameter Variants
```bash
# Move experimental versions to archive
cp Model/Coupleccino_Only_param_batman_tauH.m archive/versions/
cp Model/Coupleccino_Only_param_Before_spike_shape.m archive/versions/
cp Model/Coupleccino_Only_param_proper_params.m archive/versions/
```

### Step 4: Archive Backup Files
```bash
# Move entire backup directory
cp -r Model/Backup/ archive/backup/
```

### Step 5: Move Experimental Code
```bash
# Move batman effect experiments
cp -r "Model/1.5 nA model (Batman Effect)/" experiments/batman_effect/
cp -r "Model/Lets try/" experiments/parameter_tests/
```

### Step 6: Organize Figures
```bash
# Move figure files
cp Figs/*.fig figures/publication/
cp Figs/*.m figures/publication/
cp Model/Figures/*.fig figures/analysis/
```

### Step 7: Copy Data Extraction Script
```bash
cp "Model/Real cell extraction/Responses.m" src/data_processing/
```

### Step 8: Data Files (if you have .mat files)
```bash
# Move .mat data files to data directory
# Example: cp path/to/*.mat data/real_cells/
```

## After Migration

### Update Your Workflow

**OLD way:**
```matlab
% Navigate to Model folder
cd Model
% Run with absolute paths
Coupleccino_Only_param
```

**NEW way:**
```matlab
% From project root, run setup once
run('src/config/setup_paths.m')

% Now run from anywhere
cd src/models
single_cell_simulation

% Or directly
run('src/models/coupled_cells_simulation.m')
```

### Fix Hardcoded Paths

In each copied file, replace:
```matlab
% OLD (won't work on macOS):
addpath 'C:\Users\icbmadmin\Desktop\Team Project\Real Cell\Data'
addpath ('C:\Users\icbmadmin\Desktop\Team Project\Model\Functions')
load 20240628-B-M-3.mat
```

With:
```matlab
% NEW (portable):
% Paths are handled by setup_paths.m
% For data loading:
load(fullfile('..', '..', 'data', 'real_cells', '20240628-B-M-3.mat'))
```

## Keeping Old Structure

**You can keep your old `Model/` and `Figs/` folders!** The new structure is parallel:
- Old files remain untouched
- New organized copies in new locations
- Test new structure before deleting old files

## What to Delete (Eventually)

After confirming new structure works:
1. ❌ Delete `Model/Backup/` (now in `archive/backup/`)
2. ❌ Delete duplicate model files in `Model/`
3. ❌ Keep only ONE version in `archive/versions/`

## Version Control (.gitignore recommended)

Add to `.gitignore`:
```
# MATLAB
*.asv
*.m~

# Data files (usually too large for git)
data/real_cells/*.mat

# Generated figures
figures/generated/*.fig
figures/generated/*.png

# Old structure (after migration complete)
# Model/
# Figs/
```

## Questions?

Refer to:
- `README.md` - Project overview and usage
- `docs/FILE_DESCRIPTIONS.md` - Detailed file purposes
- `src/config/setup_paths.m` - Path configuration

---

*Created: December 2024*
