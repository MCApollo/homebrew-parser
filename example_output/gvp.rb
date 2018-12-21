name :
	 Gvp
homepage :
	 https://github.com/pote/gvp
url :
	 https://github.com/pote/gvp/archive/v0.3.0.tar.gz
description :
	 Go versioning packager
build_deps :
link_deps :
conflicts :
patches :
	 https://github.com/pote/gvp/commit/11c4cefd.patch?full_index=1
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
