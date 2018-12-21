name :
	 Fping
homepage :
	 https://fping.org/
url :
	 https://fping.org/dist/fping-4.1.tar.gz
description :
	 Scriptable ping program for checking if multiple hosts are up
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sbindir=#{bin}"
	 system "make", "install"
