#!/bin/bash -e
PATH=/raid/Qualcomm/Hexagon_SDK/3.5.1/tools/HEXAGON_Tools/8.3.07/Tools/bin:$PATH
PATH=/raid/Qualcomm/Hexagon_SDK/3.5.1/tools/qaic/Ubuntu16:$PATH
G0=/raid/Qualcomm/Hexagon_SDK/3.5.1/tools/HEXAGON_Tools/8.3.07/Tools/target/hexagon/lib/v60/G0

mkdir -p out
qaic -mdll -oout/ calculator.idl

hexagon-clang -mv60 -O0 -mG0lib -G0 -v -fpic -shared -Wl,-Bsymbolic \
  $G0/libgcc.a -Wl,--wrap=malloc -Wl,--wrap=calloc -Wl,--wrap=free -Wl,--wrap=realloc -Wl,--wrap=memalign -Wl,--wrap=__stack_chk_fail -lc \
	-Wl,-soname=libcalculator_skel.so \
	-o out/libcalculator_skel.so \
	-Iout \
  -I/raid/Qualcomm/Hexagon_SDK/3.5.1/incs/stddef \
  -I/raid/Qualcomm/Hexagon_SDK/3.5.1/incs \
  -Wl,--start-group out/calculator_skel.c calculator_imp.c -Wl,--end-group

echo "done"

