name :
	 Hebcal
homepage :
	 https://github.com/hebcal/hebcal
url :
	 https://github.com/hebcal/hebcal/archive/v4.15.tar.gz
description :
	 Perpetual Jewish calendar for the command-line
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "ACLOCAL=aclocal", "AUTOMAKE=automake"
	 system "make", "install"
