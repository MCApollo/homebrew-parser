name :
	 Xpa
homepage :
	 https://hea-www.harvard.edu/RD/xpa/
url :
	 https://github.com/ericmandel/xpa/archive/v2.1.18.tar.gz
description :
	 Seamless communication between Unix programs
build_deps :
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 mv "#{prefix}/man", man
