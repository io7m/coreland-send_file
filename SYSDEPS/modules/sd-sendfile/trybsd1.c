#include <sys/types.h>
#include <sys/socket.h>
#include <sys/uio.h>

#include <stdlib.h>

int
main (void)
{
  if (sendfile (0, 1, (off_t) 0, (size_t) 0, (struct sf_hdtr *) 0, (off_t *) 0, 0) == -1)
    exit (112);

  return 0;
}
