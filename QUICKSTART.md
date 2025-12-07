# Quick Start Guide

## First Time Setup

1. **Open MATLAB** and navigate to project directory:
   ```matlab
   cd ~/Projects/Coupleccino-HH-Model
   ```

2. **Configure paths** (run once per session):
   ```matlab
   run('src/config/setup_paths.m')
   ```

3. **Verify setup** - you should see:
   ```
   ✓ Coupleccino-HH-Model paths configured successfully!
   ```

## Running Simulations

### Single Cell Model
```matlab
% Navigate to models folder
cd src/models

% Run the simulation (after copying from Model/)
single_cell_simulation

% Or run directly
run('src/models/single_cell_simulation.m')
```

### Coupled Cells Model
```matlab
% Make sure you have data file in data/real_cells/
cd src/models
coupled_cells_simulation
```

## Common Tasks

### Analyze Spikes
```matlab
% After simulation with variable 'V1' (voltage trace)
[spike_idx, spike_height] = SpikeDetection2(V1, 5, 10, -20);
```

### Load Real Cell Data
```matlab
load(fullfile('data', 'real_cells', '20240628-B-M-3.mat'));
pro_cell = pre_cell_15(7,:);   % Select trial 7
```

### Save Figures
```matlab
saveas(gcf, 'figures/generated/my_result.fig');
saveas(gcf, 'figures/generated/my_result.png');
```

## File Migration (First Time Only)

Copy your existing files to new structure:
```bash
# From project root in terminal
cp Model/Coupleccino_Only_param.m src/models/single_cell_simulation.m
cp Model/RzDoubleCoupleccino_Elnur.m src/models/coupled_cells_simulation.m
cp Model/Functions/*.m src/analysis/
```

See `docs/MIGRATION_GUIDE.md` for complete instructions.

## Troubleshooting

### "File not found" errors
- Make sure you ran `setup_paths.m` first
- Check file exists in expected location
- Use absolute paths if needed

### Data loading issues
- Verify .mat files are in `data/real_cells/`
- Check variable names match (e.g., `pre_cell_15`)

### Path problems on macOS
- Remove old Windows paths: `C:\Users\...`
- Use `fullfile()` for portable paths
- Example: `fullfile('data', 'real_cells', 'file.mat')`

## Key Parameters to Modify

In model files, look for these sections:

**Simulation timing:**
```matlab
dt    = 0.1;     % Time step [ms]
Tinit = 1000;    % Initial period [ms]
Tinp  = 1000;    % Injection duration [ms]
```

**Current injections:**
```matlab
IampsModel = [-1.0, +1.5];  % [nA]
```

**Ion channel conductances:**
```matlab
gKFactor = 58;      % K+ conductance
gAFactor = 162;     % KA conductance  
gNFactor = 645;     % Na+ conductance
gLFactor = 10;      % Leak conductance
```

## Next Steps

1. Read `README.md` for project overview
2. Check `docs/FILE_DESCRIPTIONS.md` to understand each file
3. Follow `docs/MIGRATION_GUIDE.md` to organize your files
4. Start experimenting with parameters!

---

*Quick reference - December 2024*
