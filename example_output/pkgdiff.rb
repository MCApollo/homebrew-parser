name :
	 Pkgdiff
homepage :
	 https://lvc.github.io/pkgdiff/
url :
	 https://github.com/lvc/pkgdiff/archive/1.7.2.tar.gz
description :
	 Tool for analyzing changes in software packages (e.g. RPM, DEB, TAR.GZ)
build_deps :
link_deps :
	 binutils
	 gawk
	 wdiff
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "perl", "Makefile.pl", "--install", "--prefix=#{prefix}"
