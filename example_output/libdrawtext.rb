name :
	 Libdrawtext
homepage :
	 http://nuclear.mutantstargoat.com/sw/libdrawtext/
url :
	 https://github.com/jtsiomb/libdrawtext/archive/release_0.4.tar.gz
description :
	 Library for anti-aliased text rendering in OpenGL
build_deps :
	 pkg-config
link_deps :
	 freetype
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dbg", "--enable-opt", "--prefix=#{prefix}"
	 system "make", "install"
	 system "make", "-C", "tools/font2glyphmap"
	 system "make", "-C", "tools/font2glyphmap", "PREFIX=#{prefix}", "install"
	 pkgshare.install "examples"
