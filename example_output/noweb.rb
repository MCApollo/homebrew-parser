name :
	 Noweb
homepage :
	 https://www.cs.tufts.edu/~nr/noweb/
url :
	 https://deb.debian.org/debian/pool/main/n/noweb/noweb_2.11b.orig.tar.gz
description :
	 WEB-like literate-programming tool
build_deps :
link_deps :
	 icon
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "bash", "awkname", "awk"
	 system "make LIBSRC=icon ICONC=icont CFLAGS='-U_POSIX_C_SOURCE -D_POSIX_C_SOURCE=1'"
	 bin.mkpath
	 lib.mkpath
	 man.mkpath
	 texpath.mkpath
	 system "make", "install", "BIN=#{bin}",
	 "LIB=#{lib}",
	 "MAN=#{man}",
	 "TEXINPUTS=#{texpath}"
	 cd "icon" do
	 system "make", "install", "BIN=#{bin}",
	 "LIB=#{lib}",
	 "MAN=#{man}",
	 "TEXINPUTS=#{texpath}"
