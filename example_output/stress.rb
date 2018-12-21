name :
	 Stress
homepage :
	 https://people.seas.harvard.edu/~apw/stress/
url :
	 https://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz
description :
	 Tool to impose load on and stress test a computer system
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
