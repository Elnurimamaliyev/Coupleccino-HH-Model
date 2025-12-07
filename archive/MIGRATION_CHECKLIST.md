# Migration Checklist

Use this checklist to track your progress migrating to the new structure.

## Phase 1: Understanding (5 minutes)
- [ ] Read `PROJECT_SUMMARY.md` (this file!)
- [ ] Read `README.md` overview
- [ ] Review `docs/PROJECT_STRUCTURE.md` to see before/after

## Phase 2: Copy Files (15-20 minutes)

### Analysis Functions
- [ ] Copy `Model/Functions/SpikeDetection2.m` → `src/analysis/`
- [ ] Copy `Model/Functions/SpikeCount.m` → `src/analysis/`

### Main Models
- [ ] Copy `Model/Coupleccino_Only_param.m` → `src/models/single_cell_simulation.m`
- [ ] Copy `Model/RzDoubleCoupleccino_Elnur.m` → `src/models/coupled_cells_simulation.m`

### Data Processing
- [ ] Copy `Model/plot_real.m` → `src/data_processing/`
- [ ] Copy `Model/Real cell extraction/Responses.m` → `src/data_processing/`

### Archive Parameter Variants
- [ ] Copy `Model/Coupleccino_Only_param_batman_tauH.m` → `archive/versions/`
- [ ] Copy `Model/Coupleccino_Only_param_Before_spike_shape.m` → `archive/versions/`
- [ ] Copy `Model/Coupleccino_Only_param_proper_params.m` → `archive/versions/`

### Archive Backups
- [ ] Copy entire `Model/Backup/` folder → `archive/backup/`
  - [ ] Especially preserve `RzCell_prelim.m` (original by Go Ashida)

### Experiments
- [ ] Copy `Model/1.5 nA model (Batman Effect)/` → `experiments/batman_effect/`
- [ ] Copy `Model/Lets try/` → `experiments/parameter_tests/`

### Figures
- [ ] Copy `Figs/*.fig` → `figures/publication/`
- [ ] Copy `Figs/*.m` → `figures/publication/`
- [ ] Copy `Model/Figures/*.fig` → `figures/analysis/`

### Data Files (if you have them)
- [ ] Copy any `.mat` files → `data/real_cells/`
  - [ ] `20240628-B-M-3.mat`
  - [ ] `20240701-B-M-1.mat`
  - [ ] `20240701-S-A-1.mat`
  - [ ] `20240701-B-M-2.mat`
  - [ ] Other data files...

## Phase 3: Test Setup (5 minutes)
- [ ] Open MATLAB
- [ ] Navigate to project: `cd ~/Projects/Coupleccino-HH-Model`
- [ ] Run: `setup_paths.m` from `src/config/`
- [ ] Verify success message appears

## Phase 4: Update Code (10-20 minutes per file)

For each file you copied to `src/`:

### Update Paths
- [ ] Remove Windows paths like: `addpath 'C:\Users\icbmadmin\...'`
- [ ] Comment out or remove hardcoded `addpath` statements
- [ ] Use portable paths: `fullfile('data', 'real_cells', 'file.mat')`

### Update Data Loading
```matlab
% OLD:
load 20240628-B-M-3.mat

% NEW:
dataPath = fullfile('..', '..', 'data', 'real_cells', '20240628-B-M-3.mat');
load(dataPath);
```

### Files to Update:
- [ ] `src/models/single_cell_simulation.m`
- [ ] `src/models/coupled_cells_simulation.m`
- [ ] `src/data_processing/Responses.m`
- [ ] `src/data_processing/plot_real.m`

## Phase 5: Test Simulations (10 minutes)

### Test Single Cell Model
```matlab
run('src/config/setup_paths.m')
cd src/models
single_cell_simulation  % Should run without errors
```
- [ ] Single cell simulation runs
- [ ] Plots appear correctly
- [ ] No path errors

### Test Coupled Model
```matlab
run('src/config/setup_paths.m')
cd src/models
coupled_cells_simulation  % May need data file
```
- [ ] Coupled model runs (or shows clear data error if missing .mat)
- [ ] No path errors

### Test Analysis Functions
```matlab
% After running a simulation with voltage data 'V1'
[spike_idx, spike_height] = SpikeDetection2(V1, 5, 10, -20);
```
- [ ] Spike detection works
- [ ] Functions accessible from any directory (thanks to setup_paths)

## Phase 6: Documentation (5 minutes)

### Update Version Log
- [ ] Open `archive/VERSIONS.md`
- [ ] Add entries for parameter variants explaining what they do
- [ ] Fill in actual parameter values used

### Personal Notes
- [ ] Add any project-specific notes to README
- [ ] Document your typical workflow
- [ ] Note any custom parameter sets you use

## Phase 7: Version Control (Optional - 5 minutes)

If using git:
```bash
git add .gitignore
git add README.md QUICKSTART.md PROJECT_SUMMARY.md
git add src/ docs/ data/README.md
git add archive/VERSIONS.md
git commit -m "Restructure project with professional organization"
```

- [ ] Review `.gitignore` - add any custom exclusions
- [ ] Stage new structure files
- [ ] Commit organized structure

## Phase 8: Cleanup (Optional - After Verification)

**⚠️ ONLY after thoroughly testing new structure:**

- [ ] Verify all simulations work from new locations
- [ ] Verify you can find everything you need
- [ ] Keep original `Model/` for at least 1 week as backup
- [ ] When confident, optionally remove old structure:
  ```bash
  # DANGER: Only after complete verification!
  # mv Model/ OLD_STRUCTURE_BACKUP/
  # mv Figs/ OLD_STRUCTURE_BACKUP/
  ```

## Ongoing Maintenance

### Every Session
- [ ] Run `setup_paths.m` at start of MATLAB session
- [ ] Work from new structure locations

### When Creating New Versions
- [ ] Copy working file to `archive/versions/` with descriptive name
- [ ] Document changes in `archive/VERSIONS.md`
- [ ] Add date and purpose to version log

### When Adding New Experiments
- [ ] Create subfolder in `experiments/`
- [ ] Add README explaining experiment
- [ ] Link from main README if important

---

## Quick Command Reference

```bash
# Copy a file
cp source_file destination_file

# Copy entire directory
cp -r source_directory/ destination_directory/

# List files
ls -lh

# Find MATLAB files
find . -name "*.m"
```

```matlab
% MATLAB session start
cd ~/Projects/Coupleccino-HH-Model
run('src/config/setup_paths.m')

% Run simulation
cd src/models
single_cell_simulation
```

---

## Help & References

- **Overall guide**: `README.md`
- **Quick reference**: `QUICKSTART.md`
- **File details**: `docs/FILE_DESCRIPTIONS.md`
- **Migration help**: `docs/MIGRATION_GUIDE.md`
- **Structure info**: `docs/PROJECT_STRUCTURE.md`
- **Version tracking**: `archive/VERSIONS.md`

---

**Progress Tracker**:
- Total items: ~40-50 depending on your files
- Estimated time: 1-2 hours total
- Critical items: Phases 1-5
- Optional items: Phases 6-8

**Current Status**: ⬜ Not Started / 🟡 In Progress / ✅ Complete

---

*Checklist created: December 7, 2024*
