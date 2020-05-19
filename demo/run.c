#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <stdlib.h>
#include <linux/limits.h>

#include "calculator.h"

void fix_path() {
  char my_path[PATH_MAX+1];
  memset(my_path, 0, sizeof(my_path));

  ssize_t len = readlink("/proc/self/exe", my_path, sizeof(my_path));
  my_path[len-strlen("test_dsp")] = '\0';

  char adsp_path[PATH_MAX+1];
  snprintf(adsp_path, PATH_MAX, "ADSP_LIBRARY_PATH=%s/out", my_path);
  assert(putenv(adsp_path) == 0);
}

int main(int argc, char *argv[]) {
  fix_path();

  int vec[0x100];
  for (int i = 0; i < 0x100; i++) vec[i] = 1;
  int64 res = 0;

  int ret = calculator_sum(vec, 0x100, &res);
  assert(ret == 0);
  printf("got %lld\n", res);
  assert(res == 0x100);
}

