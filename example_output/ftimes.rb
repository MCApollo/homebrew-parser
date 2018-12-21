name :
	 Ftimes
homepage :
	 https://ftimes.sourceforge.io/FTimes/index.shtml
url :
	 https://downloads.sourceforge.net/project/ftimes/ftimes/3.11.0/ftimes-3.11.0.tgz
description :
	 System baselining and evidence collection tool
build_deps :
link_deps :
	 openssl
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-pcre=#{Formula["pcre"].opt_prefix}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--sysconfdir=#{etc}",
	 "--with-server-prefix=#{var}/ftimes"
	 inreplace "doc/ftimes/Makefile" do |s|
	 s.change_make_var! "INSTALL_PREFIX", man1
