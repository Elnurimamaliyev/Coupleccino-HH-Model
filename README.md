# Coupleccino-HH-Model
Poster -> https://github.com/Elnurimamaliyev/Coupleccino-HH-Model/blob/main/Poster_Coupleccino_Model.pdf

## Overview
Two-compartment Leech Retzius cell Hodgkin-Huxley model simulating electrical coupling between neurons (the "Coupleccino effect"). This project was developed as part of an MSc Neuroscience Team Project in Summer Semester 2024.

**Author**: Elnur Imamaliyev  
**Original Base Code**: Go Ashida (`RzCell_prelim`)  
**Date**: July 2024

## Project Description
This computational model simulates the electrophysiological properties of electrically coupled Leech Retzius cells using a multi-compartment Hodgkin-Huxley framework. The model investigates neuronal responses to current injections and compares them with real experimental recordings.

### Key Features
- **Two-compartment neuron model** with multiple ion channels (Na+, K+, KA, Ih)
- **Electrical coupling** between pre- and post-synaptic cells
- **Gap junction simulation** (variable conductance)
- **Current clamp protocols** (typically -1.0 nA and +1.5 nA injections)
- **Spike detection and analysis** utilities
- **Comparison with real cell recordings**

## Project Structure

```
Coupleccino-HH-Model/
├── README.md                          # This file
├── Poster_Coupleccino_Model.pdf      # Project presentation
│
├── src/                               # Main source code (REORGANIZED)
│   ├── models/                       # Core model implementations
│   │   ├── main_model.m             # Primary simulation (renamed from Coupleccino_Only_param.m)
│   │   └── coupled_model.m          # Coupled cell model (renamed from RzDoubleCoupleccino_Elnur.m)
│   │
│   ├── analysis/                     # Analysis and utility functions
│   │   ├── SpikeDetection2.m
│   │   └── SpikeCount.m
│   │
│   ├── data_processing/              # Real cell data extraction
│   │   └── Responses.m
│   │
│   └── config/                       # Configuration and setup
│       └── setup_paths.m             # Path configuration
│
├── data/                              # Experimental data files
│   └── real_cells/                   # Real cell recordings (.mat files)
│
├── experiments/                       # Experimental/testing scripts
│   ├── batman_effect/                # 1.5 nA specific tests
│   └── parameter_tests/              # Parameter variation experiments
│
├── figures/                           # Output figures and plots
│   └── generated/                    # Auto-generated plots
│
├── archive/                           # Old versions and backups
│   ├── versions/                     # Different model versions
│   └── backup/                       # Original backup files
│
└── docs/                              # Additional documentation
    └── FILE_DESCRIPTIONS.md          # Detailed file descriptions
```

## Ion Channels Modeled
1. **Na+ (Sodium)**: Fast activation (m³h) - Action potential generation
2. **K+ (Potassium)**: Delayed rectifier (n⁴) - Repolarization
3. **KA (A-type Potassium)**: Fast transient (z³b) - Controls firing patterns
4. **Ih (Hyperpolarization-activated)**: Slow activation (z) - Pacemaker current
5. **Leak current**: Linear conductance

## Key Parameters
- **Time step (dt)**: 0.1 ms
- **Simulation periods**:
  - Initial silent: 1000 ms
  - Current injection: 1000 ms each
  - Inter-stimulus interval: 1000 ms
- **Default conductance factors**:
  - gK: 58
  - gA: 162
  - gNa: 645
  - gL: 10

## Getting Started

### Prerequisites
- MATLAB (tested with R2020a or later)
- Signal Processing Toolbox (for `findpeaks` in spike detection)

### Setup
1. Clone or download this repository
2. Open MATLAB and navigate to the project directory
3. Run the setup script to configure paths:
   ```matlab
   run('src/config/setup_paths.m')
   ```
4. Place your experimental data files in `data/real_cells/`

### Running Simulations
```matlab
% Run the main single-cell model
cd src/models
main_model

% Run the coupled two-cell model
coupled_model
```

## Model Versions
Multiple parameter variations exist in the `archive/versions/` folder:
- `*_batman_tauH.m`: Modified Na+ inactivation time constant
- `*_proper_params.m`: Optimized parameter set
- `*_Before_spike_shape.m`: Earlier version pre-spike shape optimization

## Data Analysis
The model includes spike detection and counting utilities:
- **SpikeDetection2.m**: Detects action potentials using peak prominence
- **SpikeCount.m**: Counts spikes within specified time windows

## Known Issues
- Hardcoded absolute paths in legacy files (being addressed)
- Some model files have similar names with unclear versioning
- Mixed backup and production code (now separated in archive/)

## Future Improvements
- [ ] Implement parameter configuration file
- [ ] Add automated testing suite
- [ ] Create batch processing scripts
- [ ] Document parameter optimization process
- [ ] Add visualization presets

## References
Based on Leech Retzius cell electrophysiology and Hodgkin-Huxley formalism.

## License
Academic/Research use - MSc Team Project

## Contact
Elnur Imamaliyev - MSc Neuroscience, 2024

---
*Last updated: December 2024*
