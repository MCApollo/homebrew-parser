name :
	 Mkcue
homepage :
	 https://packages.debian.org/sid/mkcue
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/mkcue/mkcue_1.orig.tar.gz
description :
	 Generate a CUE sheet from a CD
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 bin.mkpath
	 system "make", "install"
