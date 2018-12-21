name :
	 Buildapp
homepage :
	 https://www.xach.com/lisp/buildapp/
url :
	 https://github.com/xach/buildapp/archive/release-1.5.6.tar.gz
description :
	 Creates executables with SBCL
build_deps :
link_deps :
	 sbcl
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 system "make", "install", "DESTDIR=#{prefix}"
