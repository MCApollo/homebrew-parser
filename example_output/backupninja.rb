name :
	 Backupninja
homepage :
	 https://0xacab.org/riseuplabs/backupninja
url :
	 https://sourcearchive.raspbian.org/main/b/backupninja/backupninja_1.0.2.orig.tar.gz
description :
	 Backup automation tool
build_deps :
link_deps :
	 dialog
	 gawk
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}"
	 system "make", "install", "SED=sed"
	 (var/"log").mkpath
