name :
	 Arping
homepage :
	 https://github.com/ThomasHabets/arping
url :
	 https://github.com/ThomasHabets/arping/archive/arping-2.19.tar.gz
description :
	 Utility to check whether MAC addresses are already taken on a LAN
build_deps :
	 autoconf
	 automake
link_deps :
	 libnet
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
