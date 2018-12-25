name :
	 Smartmontools
homepage :
	 https://www.smartmontools.org/
url :
	 https://downloads.sourceforge.net/project/smartmontools/smartmontools/6.6/smartmontools-6.6.tar.gz
description :
	 SMART hard drive monitoring
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 (var/"run").mkpath
	 (var/"lib/smartmontools").mkpath
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sbindir=#{bin}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}",
	 "--with-savestates",
	 "--with-attributelog"
	 system "make", "install"
