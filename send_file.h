#ifndef SEND_FILE_H
#define SEND_FILE_H

#include <integer/uint64.h>

enum {
  SEND_FILE_ALL = 0
};

int send_file (int, const char *, uint64, uint64, uint64 *);
int send_file_fd (int, int, uint64, uint64, uint64 *);

#endif
