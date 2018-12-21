name :
	 Bigloo
homepage :
	 https://www-sop.inria.fr/indes/fp/Bigloo/
url :
	 ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo4.3c.tar.gz
description :
	 Scheme implementation with object system, C, and Java interfaces
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
	 gmp
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man1}
	 --infodir=#{info}
	 --customgc=yes
	 --os-macosx
	 --native=yes
	 --disable-alsa
	 --disable-mpg123
	 --disable-flac
	 ]
	 args << "--jvm=yes" if build.with? "jvm"
	 args << "--no-gmp" if build.without? "gmp"
	 args << "--disable-srfi27" if MacOS.prefer_64_bit?
	 system "./configure", *args
	 cd "libunistring" do
	 system "make", "install"
