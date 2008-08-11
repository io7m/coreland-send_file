#include <sys/socket.h>
#include <stdlib.h>

int
main (void)
{
  if (sendfile (0, 1, (off_t) 0, (bsize_t) 0, (const struct iovec *) 0, 0) == -1)
    exit (112);

  return 0;
}
