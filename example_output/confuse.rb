name :
	 Confuse
homepage :
	 https://github.com/martinh/libconfuse
url :
	 https://github.com/martinh/libconfuse/releases/download/v3.2.2/confuse-3.2.2.tar.xz
description :
	 Configuration file parser library written in C
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
