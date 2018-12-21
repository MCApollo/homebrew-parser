name :
	 Veclibfort
homepage :
	 https://github.com/mcg1969/vecLibFort
url :
	 https://github.com/mcg1969/vecLibFort/archive/0.4.2.tar.gz
description :
	 GNU Fortran compatibility for Apple's vecLib
build_deps :
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all"
	 system "make", "PREFIX=#{prefix}", "install"
	 pkgshare.install "tester.f90"
