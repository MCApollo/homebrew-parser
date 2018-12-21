name :
	 Vavrdiasm
homepage :
	 https://github.com/vsergeev/vAVRdisasm
url :
	 https://github.com/vsergeev/vavrdisasm/archive/v3.1.tar.gz
description :
	 8-bit Atmel AVR disassembler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/Makefile b/Makefile
	 index 3b61942..f1c94fc 100644
	 --- a/Makefile
	 +++ b/Makefile
	 @@ -1,5 +1,5 @@
	 PROGNAME = vavrdisasm
	 -PREFIX = /usr
	 +PREFIX ?= /usr
	 BINDIR = $(PREFIX)/bin
	 ################################################################################
	 @@ -35,7 +35,8 @@ test: $(PROGNAME)
	 python2 crazy_test.py
	 install: $(PROGNAME)
	 -	install -D -s -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
	 +	mkdir -p $(DESTDIR)$(BINDIR)
	 +	install -s -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
	 uninstall:
	 rm -f $(DESTDIR)$(BINDIR)/$(PROGNAME)
install :
	 ENV["PREFIX"] = prefix
	 system "make"
	 system "make", "install"
