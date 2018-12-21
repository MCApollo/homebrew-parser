name :
	 IrcdHybrid
homepage :
	 http://www.ircd-hybrid.org/
url :
	 https://downloads.sourceforge.net/project/ircd-hybrid/ircd-hybrid/ircd-hybrid-8.2.24/ircd-hybrid-8.2.24.tgz
description :
	 High-performance secure IRC server
build_deps :
link_deps :
	 openssl
conflicts :
	 ircd-irc2
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--sysconfdir=#{etc}",
	 "--enable-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
	 etc.install "doc/reference.conf" => "ircd.conf"
