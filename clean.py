#!/usr/bin/env python

import os

folders = [x for x in os.listdir("case/") if os.path.isdir("case/" + x)]
for f in folders:
    dotsep = f.split(".")
    isfloat = len(dotsep) > 1 and all([x.isdigit() for x in dotsep])
    esep = f.split("e-")
    issci = len(esep) > 1 and all([x.isdigit() for x in esep])
    isnum = f.isdigit() or isfloat or issci
    if isnum and float(f) != 0:
        os.system("rm -r case/" + f)
#os.system("rm main.msh")
#os.system("rm case/0/p")
os.system("rm -r case/0/cap")
os.system("rm -r case/0/fluid")
os.system("rm -r case/0/food")
os.system("rm -r case/0/steel")

#os.system("rm -r case/constant/cap/polyMesh")
#os.system("rm -r case/constant/fluid/polyMesh")
#os.system("rm -r case/constant/food/polyMesh")
#os.system("rm -r case/constant/steel/polyMesh")
