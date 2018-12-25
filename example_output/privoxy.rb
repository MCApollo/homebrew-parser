name :
	 Privoxy
homepage :
	 https://www.privoxy.org/
url :
	 https://downloads.sourceforge.net/project/ijbswa/Sources/3.0.26%20%28stable%29/privoxy-3.0.26-stable-src.tar.gz
description :
	 Advanced filtering web proxy
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-L#{HOMEBREW_PREFIX}/lib"
	 system "autoreconf", "-i"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}/privoxy",
	 "--localstatedir=#{var}"
	 system "make"
	 system "make", "install"
