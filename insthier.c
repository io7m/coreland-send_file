#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "send_file-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "send_file.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "_sendfile.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "_sendfile.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "send_file.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "send_file.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "send_file.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "send_file.a", "libsend_file.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "send_file-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "send_file-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
