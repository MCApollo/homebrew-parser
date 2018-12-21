name :
	 Libsigcxx
homepage :
	 https://libsigcplusplus.github.io/libsigcplusplus/
url :
	 https://download.gnome.org/sources/libsigc++/2.10/libsigc++-2.10.1.tar.xz
description :
	 Callback framework for C++
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make"
	 system "make", "check"
	 system "make", "install"
