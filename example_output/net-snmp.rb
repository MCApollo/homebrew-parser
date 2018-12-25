name :
	 NetSnmp
homepage :
	 http://www.net-snmp.org/
url :
	 https://downloads.sourceforge.net/project/net-snmp/net-snmp/5.8/net-snmp-5.8.tar.gz
description :
	 Implements SNMP v1, v2c, and v3, using IPv4 and IPv6
build_deps :
link_deps :
	 openssl
optional_deps :
	 python@2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 (buildpath/"include/net-snmp/system/darwin18.h").write <<~EOS
	 #include <net-snmp/system/darwin17.h>
	 EOS
	 args = %W[
	 --disable-debugging
	 --prefix=#{prefix}
	 --enable-ipv6
	 --with-defaults
	 --with-persistent-directory=#{var}/db/net-snmp
	 --with-logfile=#{var}/log/snmpd.log
	 --with-mib-modules=host\ ucd-snmp/diskio
	 --without-rpm
	 --without-kmem-usage
	 --disable-embedded-perl
	 --without-perl-modules
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 ]
	 if build.with? "python@2"
	 args << "--with-python-modules"
	 ENV["PYTHONPROG"] = which("python2.7")
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 (var/"db/net-snmp").mkpath
	 (var/"log").mkpath
