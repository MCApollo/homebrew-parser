name :
	 DvdxrwTools
homepage :
	 http://fy.chalmers.se/~appro/linux/DVD+RW/
url :
	 http://fy.chalmers.se/~appro/linux/DVD+RW/tools/dvd+rw-tools-7.1.tar.gz
description :
	 DVD+-RW/R tools
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/Makefile.m4 b/Makefile.m4
	 index a6a100b..bf7c041 100644
	 --- a/Makefile.m4
	 +++ b/Makefile.m4
	 @@ -30,8 +30,8 @@ LINK.o	=$(LINK.cc)
	 BIN_MODE?=0755
	 install:	dvd+rw-tools
	 -	install -o root -m $(BIN_MODE) $(CHAIN) /usr/bin
	 -	install -o root -m 0644 growisofs.1 /usr/share/man/man1
	 +	install -m $(BIN_MODE) $(CHAIN) $(PREFIX)/bin
	 +	install -m 0644 growisofs.1 $(PREFIX)/share/man/man1
	 ])
	 ifelse(OS,MINGW32,[
install :
	 bin.mkpath
	 man1.mkpath
	 system "make", "PREFIX=#{prefix}", "install"
