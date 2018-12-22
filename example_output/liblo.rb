name :
	 Liblo
homepage :
	 https://liblo.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/liblo/liblo/0.29/liblo-0.29.tar.gz
description :
	 Lightweight Open Sound Control implementation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
