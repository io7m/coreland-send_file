#include <sys/sendfile.h>
#include <stdlib.h>

int
main (void)
{
  if (sendfile (0, 0, (off_t *) 0, (size_t) 0) == -1)
    exit (112);

  return 0;
}
