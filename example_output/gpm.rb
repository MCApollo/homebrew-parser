name :
	 Gpm
homepage :
	 https://github.com/pote/gpm
url :
	 https://github.com/pote/gpm/archive/v1.4.0.tar.gz
description :
	 Barebones dependency manager for Go
build_deps :
link_deps :
	 go
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
