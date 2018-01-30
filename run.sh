#!/bin/sh

# Quit script if any step has error:
set -e
# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions
# Make the mesh:
#gmsh -3 -o main.msh mesh/main.geo
# Convert the mesh to OpenFOAM format:
gmshToFoam mesh/hpt2.msh -case case

splitMeshRegions -case case -cellZones -overwrite
# Adjust polyMesh/boundary:
changeDictionary -case case -region cap
#changeDictionary -enableFunctionEntries -case case -region food
#changeDictionary -enableFunctionEntries -case case -region fluid
#changeDictionary -enableFunctionEntries -case case -region steel

# Let's set the initial conditions (high-pressure blast source)
# First, let's load original p file.
##cp case/0/p.original case/0/p
##setFields -case case
# Finally, run the simulation:
#chtMultiRegionFoam -case case