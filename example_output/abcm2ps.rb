name :
	 Abcm2ps
homepage :
	 http://moinejf.free.fr
url :
	 https://github.com/leesavide/abcm2ps/archive/v8.14.1.tar.gz
description :
	 ABC music notation software
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
