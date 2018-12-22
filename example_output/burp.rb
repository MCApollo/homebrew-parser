name :
	 Burp
homepage :
	 https://burp.grke.org/
url :
	 https://downloads.sourceforge.net/project/burp/burp-2.1.32/burp-2.1.32.tar.bz2
description :
	 Network backup and restore
build_deps :
	 pkg-config
link_deps :
	 librsync
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 resource("uthash").stage do
	 (buildpath/"uthash/include").install "src/uthash.h"
	 end
	 ENV.prepend "CPPFLAGS", "-I#{buildpath}/uthash/include"
	 system "autoreconf", "-fiv" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}/burp",
	 "--sbindir=#{bin}",
	 "--localstatedir=#{var}"
	 system "make", "install-all"
	 (var/"run").mkpath
	 (var/"spool/burp").mkpath
