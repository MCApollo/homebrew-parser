name :
	 Beagle
homepage :
	 https://github.com/beagle-dev/beagle-lib
url :
	 https://github.com/beagle-dev/beagle-lib/archive/v3.1.2.tar.gz
description :
	 Evaluate the likelihood of sequence evolution on trees
build_deps :
	 autoconf
	 automake
	 doxygen
	 libtool
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--without-cuda",
	 "--disable-libtool-dev"
	 system "make", "install"
