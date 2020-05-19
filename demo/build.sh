#!/bin/bash -e
SDK=/raid/Qualcomm/Hexagon_SDK/3.5.1/

PATH=$SDK/tools/HEXAGON_Tools/8.3.07/Tools/bin:$PATH
PATH=$SDK/tools/qaic/Ubuntu16:$PATH
G0=$SDK/tools/HEXAGON_Tools/8.3.07/Tools/target/hexagon/lib/v60/G0

mkdir -p out
qaic -mdll -oout/ calculator.idl

hexagon-clang -mv60 -fpic -shared \
  -o out/libcalculator_skel.so \
  -Iout -Iinclude \
  out/calculator_skel.c calculator_imp.c

