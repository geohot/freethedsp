#!/bin/bash -e
PATH=/raid/Qualcomm/Hexagon_SDK/3.5.1/tools/HEXAGON_Tools/8.3.07/Tools/bin:$PATH
PATH=/raid/Qualcomm/Hexagon_SDK/3.5.1/tools/qaic/Ubuntu16:$PATH
G0=/raid/Qualcomm/Hexagon_SDK/3.5.1/tools/HEXAGON_Tools/8.3.07/Tools/target/hexagon/lib/v60/G0

mkdir -p out
qaic -mdll -oout/ calculator.idl

hexagon-clang -mv60 -fpic -shared \
	-o out/libcalculator_skel.so \
	-Iout -Iinclude \
  out/calculator_skel.c calculator_imp.c

