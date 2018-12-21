name :
	 Juise
homepage :
	 https://github.com/Juniper/juise/wiki
url :
	 https://github.com/Juniper/juise/releases/download/0.8.0/juise-0.8.0.tar.gz
description :
	 JUNOS user interface scripting environment
build_deps :
	 libtool
link_deps :
	 libslax
conflicts :
patches :
EOF_patch :
install :
	 system "sh", "./bin/setup.sh" if build.head?
	 inreplace "configure",
	 "SLAX_EXTDIR=\"`$SLAX_CONFIG --extdir | head -1`\"",
	 "SLAX_EXTDIR=\"#{lib}/slax/extensions\""
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-libedit"
	 system "make", "install"
