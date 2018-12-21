name :
	 Bgpq3
homepage :
	 http://snar.spb.ru/prog/bgpq3/
url :
	 https://github.com/snar/bgpq3/archive/v0.1.35.tar.gz
description :
	 BGP filtering automation for Cisco, Juniper, BIRD and OpenBGPD routers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/Makefile.in b/Makefile.in
	 index c2d7e96..afec780 100644
	 --- a/Makefile.in
	 +++ b/Makefile.in
	 @@ -29,9 +29,10 @@ clean:
	 rm -rf *.o *.core core.* core
	 install: bgpq3
	 +	if test ! -d @prefix@/bin ; then mkdir -p @prefix@/bin ; fi
	 ${INSTALL} -c -s -m 755 bgpq3 @bindir@
	 -	if test ! -d @prefix@/man/man8 ; then mkdir -p @prefix@/man/man8 ; fi
	 -	${INSTALL} -m 644 bgpq3.8 @prefix@/man/man8
	 +	if test ! -d @mandir@/man8 ; then mkdir -p @mandir@/man8 ; fi
	 +	${INSTALL} -m 644 bgpq3.8 @mandir@/man8
	 depend:
	 makedepend -- $(CFLAGS) -- $(SRCS)
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
