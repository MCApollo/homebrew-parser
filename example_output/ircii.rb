name :
	 Ircii
homepage :
	 http://www.eterna.com.au/ircii/
url :
	 https://ircii.warped.com/ircii-20170704.tar.bz2
description :
	 IRC and ICB client
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LIBS", "-liconv"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-default-server=irc.freenode.net",
	 "--enable-ipv6"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
