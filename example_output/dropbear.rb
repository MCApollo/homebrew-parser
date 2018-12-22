name :
	 Dropbear
homepage :
	 https://matt.ucc.asn.au/dropbear/dropbear.html
url :
	 https://matt.ucc.asn.au/dropbear/releases/dropbear-2018.76.tar.bz2
description :
	 Small SSH server/client for POSIX-based system
build_deps :
link_deps :
conflicts :
patches :
	 https://secure.ucc.asn.au/hg/dropbear/raw-rev/5d2d1021ca00
EOF_patch :
install :
	 ENV.deparallelize
	 if build.head?
	 system "autoconf"
	 system "autoheader"
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-pam",
	 "--enable-zlib",
	 "--enable-bundled-libtom",
	 "--sysconfdir=#{etc}/dropbear"
	 system "make"
	 system "make", "install"
