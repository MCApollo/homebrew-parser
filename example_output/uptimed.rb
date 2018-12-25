name :
	 Uptimed
homepage :
	 https://github.com/rpodgorny/uptimed/
url :
	 https://github.com/rpodgorny/uptimed/archive/v0.4.1.tar.gz
description :
	 Utility to track your highest uptimes
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 inreplace "Makefile", "/var/spool/uptimed", "#{var}/uptimed"
	 inreplace "libuptimed/urec.h", "/var/spool", var
	 inreplace "etc/uptimed.conf-dist", "/var/run", "#{var}/uptimed"
	 system "make", "install"
