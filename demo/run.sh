#!/usr/bin/env bash
gcc -L/system/vendor/lib64 -Iout -Iinclude run.c out/calculator_stub.c ../freethedsp.c -I../include -o test_dsp -ladsprpc -ldl
./test_dsp
