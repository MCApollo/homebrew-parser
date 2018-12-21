name :
	 Lutok
homepage :
	 https://github.com/jmmv/lutok
url :
	 https://github.com/jmmv/lutok/releases/download/lutok-0.4/lutok-0.4.tar.gz
description :
	 Lightweight C++ API for Lua
build_deps :
	 pkg-config
link_deps :
	 lua
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "check"
	 system "make", "install"
	 system "make", "installcheck"
