name :
	 Shc
homepage :
	 https://neurobin.github.io/shc
url :
	 https://github.com/neurobin/shc/archive/4.0.1.tar.gz
description :
	 Shell Script Compiler
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make", "install", "prefix=#{prefix}"
	 pkgshare.install "test"
