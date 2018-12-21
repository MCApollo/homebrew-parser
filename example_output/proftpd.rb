name :
	 Proftpd
homepage :
	 http://www.proftpd.org/
url :
	 ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.6.tar.gz
description :
	 Highly configurable GPL-licensed FTP server software
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "sample-configurations/basic.conf", "nogroup", "nobody"
	 system "./configure", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}"
	 ENV.deparallelize
	 install_user = ENV["USER"]
	 install_group = `groups`.split[0]
	 system "make", "INSTALL_USER=#{install_user}", "INSTALL_GROUP=#{install_group}", "install"
