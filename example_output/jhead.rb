name :
	 Jhead
homepage :
	 http://www.sentex.net/~mwandel/jhead/
url :
	 http://www.sentex.net/~mwandel/jhead/jhead-3.00.tar.gz
description :
	 Extract Digicam setting info from EXIF JPEG headers
build_deps :
link_deps :
conflicts :
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/j/jhead/jhead_3.00-4.debian.tar.xz
EOF_patch :
	 --- a/makefile	2015-02-02 23:24:06.000000000 +0100
	 +++ b/makefile	2015-02-25 16:31:21.000000000 +0100
	 @@ -1,12 +1,18 @@
	 #--------------------------------
	 #--------------------------------
	 +PREFIX=$(DESTDIR)/usr/local
	 +BINDIR=$(PREFIX)/bin
	 +DOCDIR=$(PREFIX)/share/doc/jhead
	 +MANDIR=$(PREFIX)/share/man/man1
	 OBJ=.
	 SRC=.
	 CFLAGS:= $(CFLAGS) -O3 -Wall
	 all: jhead
	 +docs = $(SRC)/usage.html
	 +
	 objs = $(OBJ)/jhead.o $(OBJ)/jpgfile.o $(OBJ)/jpgqguess.o $(OBJ)/paths.o \
	 $(OBJ)/exif.o $(OBJ)/iptc.o $(OBJ)/gpsinfo.o $(OBJ)/makernote.o
	 @@ -19,5 +25,8 @@
	 clean:
	 rm -f $(objs) jhead
	 -install:
	 -	cp jhead ${DESTDIR}/usr/local/bin/
	 +install: all
	 +	install -d $(BINDIR) $(DOCDIR) $(MANDIR)
	 +	install -m 0755 jhead $(BINDIR)
	 +	install -m 0644 $(docs) $(DOCDIR)
	 +	install -m 0644 jhead.1 $(MANDIR)
install :
	 system "make", "install", "PREFIX=#{prefix}"
