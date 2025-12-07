# File Descriptions - Coupleccino-HH-Model

## Model Files (Original Location: `Model/`)

### Main Models

#### `Coupleccino_Only_param.m` → `src/models/main_model.m`
**Purpose**: Single compartment or primary model simulation  
**Key Features**:
- Simulates neuronal response to current injections
- Default current amplitudes: -1.0 nA, +1.5 nA
- Ion channel conductances: gK=58, gA=162, gNa=645, gL=10
- Does NOT load real cell data (commented out)
- Pure model simulation for parameter testing

**Suggested New Name**: `single_cell_simulation.m`

---

#### `RzDoubleCoupleccino_Elnur.m` → `src/models/coupled_model.m`
**Purpose**: Two electrically coupled Retzius cells simulation  
**Key Features**:
- Models pre-synaptic and post-synaptic cells with gap junction
- Compares model output with real experimental data
- Loads real cell recordings: `20240628-B-M-3.mat`
- Synchronized current injections to both cells
- Gap junction conductance modeling

**Suggested New Name**: `coupled_cells_simulation.m`

---

### Model Variants (Should move to `archive/versions/`)

#### `Coupleccino_Only_param_batman_tauH.m`
**Purpose**: Modified Na⁺ inactivation time constant  
**Modification**: Adjusted `tauH(v)` function to investigate "Batman effect" (unusual voltage response)  
**Note**: Experimental parameter variant

---

#### `Coupleccino_Only_param_Before_spike_shape.m`
**Purpose**: Earlier version before spike shape optimization  
**Status**: Historical backup - preserved for reference

---

#### `Coupleccino_Only_param_proper_params.m`
**Purpose**: Optimized parameter set version  
**Note**: Contains manually tuned conductances for better fit to experimental data

---

#### `plot_real.m`
**Purpose**: Plotting utility for real cell data visualization  
**Suggested Location**: `src/data_processing/`

---

### Specialized Experiments

#### `1.5 nA model (Batman Effect)/`
**Purpose**: Investigation of unusual voltage dynamics at 1.5 nA injection  
**Files**:
- `RzDoubleCouplechinno1_5nA.m` - Main simulation
- `RzDoubleCouplechinno1_5nA - Copy.m` - Backup variant

**Should Move To**: `experiments/batman_effect/`

---

## Analysis Functions (`Model/Functions/`)

#### `SpikeDetection2.m` → `src/analysis/`
**Purpose**: Detect action potentials in voltage traces  
**Method**: Uses MATLAB's `findpeaks()` with prominence and width criteria  
**Input Parameters**:
- `respmatrix`: Response voltage matrix
- `MinPeakProminence`: Minimum spike prominence [mV]
- `MaxPeakWidth`: Maximum peak width [ms]
- `MinPeakHeight`: Minimum peak height [mV]

**Output**: Spike indices and heights

---

#### `SpikeCount.m` → `src/analysis/`
**Purpose**: Count spikes within specified time windows  
**Features**:
- Counts spikes per trial
- Calculates spike timing statistics
- Handles multiple trials

**Input**: Spike detection results + time window  
**Output**: Spike count and timing statistics

---

## Data Processing (`Model/Real cell extraction/`)

#### `Responses.m` → `src/data_processing/`
**Purpose**: Extract and visualize real cell recordings from .mat files  
**Data Sources**:
- `20240628-B-M-3.mat`
- `20240701-B-M-1.mat`
- `20240701-S-A-1.mat`
- `20240701-B-M-2.mat`

**Variables in data files**:
- `pre_cell_15` - Pre-synaptic control responses
- `post_cell_15` - Post-synaptic control responses
- `pre_cell_pharma_XX` - Pharmacological condition responses
- `post_cell_pharma_XX` - Pharmacological post-synaptic responses

**Note**: Extracts specific time windows (e.g., 239001:259001) for analysis

---

## Backup Files (`Model/Backup/`)

### Should Move to `archive/backup/`

- `Compare2TypicalCells2.m` - Comparison script (legacy)
- `CompareConditions2.m` - Multi-condition comparison (legacy)
- `RzCell_prelim.m` - **ORIGINAL MODEL by Go Ashida** (important reference)
- `RzDoubleCoupleccino_Elnur.m` - Duplicate of main file
- `RzDoubleCouplechinno1_5nA.m` - 1.5 nA experiment backup

---

## Figures

### `Figs/` → `figures/publication/` (suggested)
- `3spikes.fig` - Three spike response figure
- `4spikes.fig` - Four spike response figure
- `Feature.fig` - Feature extraction visualization
- `passive.fig` - Passive membrane properties
- `Ratio.fig` - Response ratio analysis
- `untitled.m` - Figure generation script (needs descriptive name)

### `Model/Figures/` → `figures/analysis/` (suggested)
- Additional figure variants

---

## Important Original File

### `Model/Backup/RzCell_prelim.m`
**Author**: Go Ashida (original)  
**Importance**: ⭐ **BASE MODEL** - All other models derived from this  
**Should**: Keep in `archive/` with clear documentation as reference

**Contains**:
- Original compartment model function
- All ion channel equations (infM, infH, infN, infB, infZ)
- Time constant functions (tauH, tauN, tauB, tauZ)
- Original parameter values

---

## Migration Map Summary

```
Model/
├── Coupleccino_Only_param.m              → src/models/single_cell_simulation.m
├── RzDoubleCoupleccino_Elnur.m          → src/models/coupled_cells_simulation.m
├── *_batman_tauH.m                       → archive/versions/
├── *_Before_spike_shape.m                → archive/versions/
├── *_proper_params.m                     → archive/versions/
├── plot_real.m                           → src/data_processing/
├── Functions/
│   ├── SpikeDetection2.m                → src/analysis/
│   └── SpikeCount.m                     → src/analysis/
├── Real cell extraction/
│   └── Responses.m                      → src/data_processing/
├── 1.5 nA model/                         → experiments/batman_effect/
├── Backup/                               → archive/backup/
├── Lets try/                             → experiments/parameter_tests/
└── Figures/                              → figures/analysis/

Figs/                                     → figures/publication/
```

---

## Recommendations

1. **Keep**: Original `RzCell_prelim.m` as important reference
2. **Rename**: Main files to descriptive names (single_cell, coupled_cells)
3. **Archive**: Parameter variants with VERSION.md explaining differences
4. **Consolidate**: Multiple backup folders into single `archive/`
5. **Document**: Create experiment logs for batman_effect and parameter tests
6. **Data**: Move .mat files to `data/real_cells/` with README explaining format

---

*Document created: December 2024*  
*Maintainer: Elnur Imamaliyev*
