#!/usr/bin/env bash
gcc -L/system/vendor/lib64 -ladsprpc -Iout -Iinclude run.c out/calculator_stub.c ../freethedsp.c -I../include -o test_dsp
./test_dsp
