name :
	 Libewf
homepage :
	 https://github.com/libyal/libewf
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/libe/libewf/libewf_20140608.orig.tar.gz
description :
	 Library for support of the Expert Witness Compression Format
build_deps :
	 pkg-config
link_deps :
	 openssl
optional_deps :
	 :osxfuse
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 system "./synclibs.sh"
	 system "./autogen.sh"
	 end
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 ]
	 args << "--with-libfuse=no" if build.without? "osxfuse"
	 system "./configure", *args
	 system "make", "install"
