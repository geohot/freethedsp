#include "calculator.h"

int calculator_sum(const int* vec, int vecLen, int64* res) {
  int ii = 0;
  *res = 0;
  for (ii = 0; ii < vecLen; ++ii) {
    *res = *res + vec[ii];
  }
  return 0;
}
