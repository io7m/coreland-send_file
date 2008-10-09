# auto generated - do not edit

default: all

all:\
ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.o ctxt/incdir.o ctxt/ldflags.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o deinstaller deinstaller.o inst-check \
inst-check.o inst-copy inst-copy.o inst-dir inst-dir.o inst-link inst-link.o \
install_core.o install_error.o installer installer.o instchk instchk.o \
insthier.o send_file-conf send_file-conf.o send_file.a send_file.o

# Mkf-deinstall
deinstall: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller
deinstall-dryrun: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller dryrun

# Mkf-install
install: installer inst-check inst-copy inst-dir inst-link postinstall
	./installer
	./postinstall

install-dryrun: installer inst-check inst-copy inst-dir inst-link
	./installer dryrun

# Mkf-instchk
install-check: instchk inst-check
	./instchk

# -- SYSDEPS start
flags-corelib:
	@echo SYSDEPS corelib-flags run create flags-corelib 
	@(cd SYSDEPS/modules/corelib-flags && ./run)
libs-corelib-S:
	@echo SYSDEPS corelib-libs-S run create libs-corelib-S 
	@(cd SYSDEPS/modules/corelib-libs-S && ./run)
flags-integer:
	@echo SYSDEPS integer-flags run create flags-integer 
	@(cd SYSDEPS/modules/integer-flags && ./run)
libs-integer-S:
	@echo SYSDEPS integer-libs-S run create libs-integer-S 
	@(cd SYSDEPS/modules/integer-libs-S && ./run)
_sendfile.h:
	@echo SYSDEPS sd-sendfile run create libs-sendfile _sendfile.h 
	@(cd SYSDEPS/modules/sd-sendfile && ./run)
libs-sendfile: _sendfile.h
_sysinfo.h:
	@echo SYSDEPS sysinfo run create _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./run)


corelib-flags_clean:
	@echo SYSDEPS corelib-flags clean flags-corelib 
	@(cd SYSDEPS/modules/corelib-flags && ./clean)
corelib-libs-S_clean:
	@echo SYSDEPS corelib-libs-S clean libs-corelib-S 
	@(cd SYSDEPS/modules/corelib-libs-S && ./clean)
integer-flags_clean:
	@echo SYSDEPS integer-flags clean flags-integer 
	@(cd SYSDEPS/modules/integer-flags && ./clean)
integer-libs-S_clean:
	@echo SYSDEPS integer-libs-S clean libs-integer-S 
	@(cd SYSDEPS/modules/integer-libs-S && ./clean)
sd-sendfile_clean:
	@echo SYSDEPS sd-sendfile clean libs-sendfile _sendfile.h 
	@(cd SYSDEPS/modules/sd-sendfile && ./clean)
sysinfo_clean:
	@echo SYSDEPS sysinfo clean _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./clean)


sysdeps_clean:\
corelib-flags_clean \
corelib-libs-S_clean \
integer-flags_clean \
integer-libs-S_clean \
sd-sendfile_clean \
sysinfo_clean \


# -- SYSDEPS end


cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags conf-ccfflist flags-integer \
	flags-corelib

cc-link:\
conf-ld conf-ldtype conf-systype conf-ldfflist libs-integer-S libs-corelib-S \
	libs-corelib-C

cc-slib:\
conf-systype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-sosuffix:\
mk-sosuffix
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp conf-sosuffix

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

# ctxt/bindir.c.mff
ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/ldflags.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/ldflags.o \
	ctxt/repos.o ctxt/slibdir.o ctxt/version.o

# ctxt/dlibdir.c.mff
ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c
	./cc-compile ctxt/dlibdir.c

# ctxt/incdir.c.mff
ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c
	./cc-compile ctxt/incdir.c

# ctxt/ldflags.c.mff
ctxt/ldflags.c: mk-ctxt libs-sendfile
	rm -f ctxt/ldflags.c
	./mk-ctxt ctxt_ldflags < libs-sendfile > ctxt/ldflags.c

ctxt/ldflags.o:\
cc-compile ctxt/ldflags.c
	./cc-compile ctxt/ldflags.c

# ctxt/repos.c.mff
ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c
	./cc-compile ctxt/repos.c

# ctxt/slibdir.c.mff
ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c
	./cc-compile ctxt/slibdir.c

# ctxt/version.c.mff
ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a
	./cc-link deinstaller deinstaller.o insthier.o install_core.o install_error.o \
	ctxt/ctxt.a

deinstaller.o:\
cc-compile deinstaller.c install.h
	./cc-compile deinstaller.c

inst-check:\
cc-link inst-check.ld inst-check.o install_error.o
	./cc-link inst-check inst-check.o install_error.o

inst-check.o:\
cc-compile inst-check.c install.h
	./cc-compile inst-check.c

inst-copy:\
cc-link inst-copy.ld inst-copy.o install_error.o
	./cc-link inst-copy inst-copy.o install_error.o

inst-copy.o:\
cc-compile inst-copy.c install.h
	./cc-compile inst-copy.c

inst-dir:\
cc-link inst-dir.ld inst-dir.o install_error.o
	./cc-link inst-dir inst-dir.o install_error.o

inst-dir.o:\
cc-compile inst-dir.c install.h
	./cc-compile inst-dir.c

inst-link:\
cc-link inst-link.ld inst-link.o install_error.o
	./cc-link inst-link inst-link.o install_error.o

inst-link.o:\
cc-compile inst-link.c install.h
	./cc-compile inst-link.c

install_core.o:\
cc-compile install_core.c install.h
	./cc-compile install_core.c

install_error.o:\
cc-compile install_error.c install.h
	./cc-compile install_error.c

installer:\
cc-link installer.ld installer.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a
	./cc-link installer installer.o insthier.o install_core.o install_error.o \
	ctxt/ctxt.a

installer.o:\
cc-compile installer.c install.h
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a
	./cc-link instchk instchk.o insthier.o install_core.o install_error.o \
	ctxt/ctxt.a

instchk.o:\
cc-compile instchk.c install.h
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c ctxt.h install.h
	./cc-compile insthier.c

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc

mk-sosuffix:\
conf-systype

mk-systype:\
conf-cc

send_file-conf:\
cc-link send_file-conf.ld send_file-conf.o ctxt/ctxt.a
	./cc-link send_file-conf send_file-conf.o ctxt/ctxt.a

send_file-conf.o:\
cc-compile send_file-conf.c ctxt.h _sysinfo.h
	./cc-compile send_file-conf.c

send_file.a:\
cc-slib send_file.sld send_file.o
	./cc-slib send_file send_file.o

send_file.o:\
cc-compile send_file.c _sendfile.h send_file.h
	./cc-compile send_file.c

clean-all: sysdeps_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.c ctxt/dlibdir.o \
	ctxt/incdir.c ctxt/incdir.o ctxt/ldflags.c ctxt/ldflags.o ctxt/repos.c \
	ctxt/repos.o ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o \
	deinstaller deinstaller.o inst-check inst-check.o inst-copy inst-copy.o \
	inst-dir inst-dir.o inst-link inst-link.o install_core.o install_error.o \
	installer installer.o instchk instchk.o insthier.o send_file-conf \
	send_file-conf.o send_file.a send_file.o
ext_clean:
	rm -f conf-cctype conf-ldtype conf-sosuffix conf-systype mk-ctxt

regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
