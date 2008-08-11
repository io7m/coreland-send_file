#include <errno.h>
#include <unistd.h>
#include <fcntl.h>

#include "_sendfile.h"
#include "send_file.h"

/*
 * bsd implementation
 */

#if defined (HAVE_SENDFILE_BSD)
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/uio.h>

int
send_file_fd (int out_fd, int in_fd, uint64 offset, uint64 size, uint64 *sent)
{
  off_t sbytes = 0;

  if (sendfile (in_fd, out_fd, offset, size, 0, &sbytes, 0) == -1)
    if (errno == EAGAIN) {
      *sent = (uint64) sbytes;
      return -1;
    }
  *sent = (uint64) sbytes;
  return 0;
}
#endif /* HAVE_SENDFILE_BSD */

/*
 * hp-ux implementation
 */

#if defined (HAVE_SENDFILE_HPUX)
#include <sys/socket.h>

int
send_file_fd (int out_fd, int in_fd, uint64 offset, uint64 size, uint64 *sent)
{
  sbsize_t r_sent = 0;

  if (sendfile (out_fd, in_fd, offset, size, 0, 0) == -1) {
    *sent = r_sent;
    return -1;
  }
  *sent = r_sent;
  return 0;
}
#endif

/*
 * sysv implementation (solaris, linux)
 */

#if defined (HAVE_SENDFILE_SYSV)
#include <sys/sendfile.h>

int
send_file_fd (int out_fd, int in_fd, uint64 offset, uint64 size, uint64 *sent)
{
  ssize_t r_send = 0;
  off_t off = (off_t) offset;

  if (sendfile (out_fd, in_fd, &off, size) == -1) {
    *sent = 0;
    return -1;
  }
  *sent = r_send;
  return 0;
}
#endif /* HAVE_SENDFILE_SYSV */

/*
 * buffer.h based fallback
 */

#if !defined (HAVE_SENDFILE)
#include <integer/int64.h>
#include <corelib/buffer.h>

int
send_file_fd (int out_fd, int in_fd, uint64 offset, uint64 size, uint64 *sent)
{
  char data_in[BUFFER_INSIZE];
  char data_out[BUFFER_OUTSIZE];
  struct buffer buf_in;
  struct buffer buf_out;
  int64 r;
  int64 w;
  uint64 r_sent = 0;
  char *x;

  buffer_init (&buf_in, (buffer_op) read, in_fd, data_in, sizeof (data_in));
  buffer_init (&buf_out, (buffer_op) write, out_fd, data_out, sizeof (data_out));

  for (;;) {
    r = buffer_feed (&buf_in);
    if (r == 0) break;
    if (r == -1) goto FAIL;
    x = buffer_peek (&buf_in);
    w = buffer_put (&buf_out, x, r);
    if (w == -1) goto FAIL;
    buffer_seek (&buf_in, r);
    r_sent += w;
  }
  *sent = r_sent;
  return 0;

  FAIL:
  *sent = r_sent;
  return -1;
}
#endif /* !HAVE_SENDFILE */

int
send_file (int out_fd, const char *name, uint64 offset, uint64 size, uint64 *sent)
{
  int errno_save;
  int fd;

  fd = open (name, O_RDONLY);
  if (fd == -1) return -1;
  if (send_file_fd (out_fd, fd, offset, size, sent) == -1) {
    errno_save = errno; close (fd); errno = errno_save;
    return -1;
  }
  if (close (fd) == -1) return -1;
  return 0;
}
