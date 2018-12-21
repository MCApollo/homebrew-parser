name :
	 Check
homepage :
	 https://libcheck.github.io/check/
url :
	 https://github.com/libcheck/check/releases/download/0.12.0/check-0.12.0.tar.gz
description :
	 C unit testing framework
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
