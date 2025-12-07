# Model Versions Log

## Overview
This document tracks different parameter variations and their purposes.

---

## Main Production Models

### `single_cell_simulation.m` (formerly `Coupleccino_Only_param.m`)
**Status**: ✅ Primary model  
**Date**: July 2024  
**Purpose**: Single cell simulation without real data comparison  
**Parameters**: Default conductances (gK=58, gA=162, gNa=645, gL=10)

### `coupled_cells_simulation.m` (formerly `RzDoubleCoupleccino_Elnur.m`)
**Status**: ✅ Primary coupled model  
**Date**: July 2024  
**Purpose**: Two electrically coupled cells with real data comparison  
**Data Required**: `20240628-B-M-3.mat`

---

## Experimental Versions (in `archive/versions/`)

### `Coupleccino_Only_param_proper_params.m`
**Date**: July 2024  
**Modifications**:
- Manually optimized conductance parameters
- Better fit to experimental spike patterns

**Key Changes**:
```matlab
% Adjusted parameters (document specific values here)
gKFactor = XX;  % Modified from default 58
gAFactor = XX;  % Modified from default 162
```

**Outcome**: [Add notes on whether this improved fit]

---

### `Coupleccino_Only_param_batman_tauH.m`
**Date**: July 2024  
**Purpose**: Investigation of "Batman effect" - unusual voltage response shape  

**Modifications**:
- Modified Na+ inactivation time constant `tauH(v)` function
- Investigated effect on spike shape

**Key Changes**:
```matlab
function x = tauH(v)
    % Modified time constant
    % [Document the specific modification]
end
```

**Outcome**: [Add findings about batman effect]

---

### `Coupleccino_Only_param_Before_spike_shape.m`
**Date**: Before July 2024  
**Purpose**: Historical backup before spike shape optimization  

**Status**: 📦 Archive only - reference version  

**Notes**:
- Preserved for comparing against optimized version
- Shows evolution of parameter tuning process

---

## Experimental Studies

### 1.5 nA Batman Effect Study
**Location**: `experiments/batman_effect/`  
**Files**: `RzDoubleCouplechinno1_5nA.m`

**Purpose**: 
- Focused investigation of voltage dynamics at +1.5 nA injection
- Unusual response pattern nicknamed "batman effect"

**Specific Modifications**:
- [Document parameter changes specific to 1.5 nA case]

---

## Parameter Comparison Table

| Version | gK | gA | gNa | gL | Notes |
|---------|----|----|-----|----|----|
| Default | 58 | 162 | 645 | 10 | Standard parameters |
| proper_params | ? | ? | ? | ? | Optimized for fit |
| batman_tauH | 58 | 162 | 645 | 10 | Modified tauH only |

---

## Testing Experiments (in `experiments/parameter_tests/`)

### Parameter Space Exploration
**Location**: `experiments/parameter_tests/`  
**Files**: Contents of former `Lets try/` folder

**Purpose**: Quick parameter tests and exploratory simulations

---

## Version Control Guidelines

### When to Create a New Version:
1. ✅ Significant parameter changes affecting results
2. ✅ New ion channel dynamics
3. ✅ Different model architecture
4. ✅ Before major refactoring

### How to Name New Versions:
```
[model_name]_[modification]_[date].m

Examples:
- single_cell_optimized_params_20241207.m
- coupled_cells_new_gap_junction_20241207.m
```

### What to Document:
1. Date of modification
2. Purpose of changes
3. Specific parameters modified
4. Expected outcomes
5. Actual results (after testing)

---

## Baseline Reference

### Original Model: `RzCell_prelim.m` (Go Ashida)
**Location**: `archive/backup/`  
**Status**: 🔒 **DO NOT MODIFY** - Historical reference  

**Importance**: This is the foundation all other models are based on

**Contains**:
- Original compartment equations
- Baseline ion channel kinetics
- Reference parameter values

---

## Recommendations

1. **Before modifying**: Copy to `archive/versions/` with descriptive name
2. **Document changes**: Add entry to this log
3. **Test thoroughly**: Compare with baseline before archiving old version
4. **Keep baseline**: Always preserve original working version

---

## Change Log Template

When adding new version, copy this template:

```markdown
### `[filename].m`
**Date**: YYYY-MM-DD
**Author**: Name
**Base Version**: [what it's modified from]

**Purpose**: 
[Why this modification was made]

**Modifications**:
- [List specific changes]
- [Parameter adjustments]

**Parameters Changed**:
```matlab
% Code showing parameter changes
```

**Results**:
[What happened when tested]

**Status**: [Active / Archived / Superseded by X]
```

---

*Last Updated: December 2024*  
*Maintainer: Elnur Imamaliyev*
