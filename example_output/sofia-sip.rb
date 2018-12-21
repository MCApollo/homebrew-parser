name :
	 SofiaSip
homepage :
	 https://sofia-sip.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sofia-sip/sofia-sip/1.12.11/sofia-sip-1.12.11.tar.gz
description :
	 SIP User-Agent library
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
