name :
	 Cheops
homepage :
	 https://logological.org/cheops
url :
	 https://files.nothingisreal.com/software/cheops/cheops-1.3.tar.bz2
description :
	 CHEss OPponent Simulator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
