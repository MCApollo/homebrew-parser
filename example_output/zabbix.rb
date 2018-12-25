name :
	 Zabbix
homepage :
	 https://www.zabbix.com/
url :
	 https://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.4.13/zabbix-3.4.13.tar.gz
description :
	 Availability and monitoring solution
build_deps :
link_deps :
	 openssl
	 pcre
	 postgresql
	 fping
	 libevent
	 libssh2
optional_deps :
	 mysql
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 sdk = MacOS::CLT.installed? ? "" : MacOS.sdk_path
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}/zabbix
	 --enable-agent
	 --with-iconv=#{sdk}/usr
	 --with-libpcre=#{Formula["pcre"].opt_prefix}
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 ]
	 if build.with? "server-proxy"
	 args += %w[
	 --enable-server
	 --enable-proxy
	 --enable-ipv6
	 --with-net-snmp
	 --with-libcurl
	 --with-ssh2
	 ]
	 if build.with? "mysql"
	 args << "--with-mysql=#{brewed_or_shipped("mysql_config")}"
	 elsif build.with? "sqlite"
	 args << "--with-sqlite3"
	 else
	 args << "--with-postgresql=#{brewed_or_shipped("pg_config")}"
	 end
	 end
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "configure", "clock_gettime(CLOCK_REALTIME, &tp);",
	 "undefinedgibberish(CLOCK_REALTIME, &tp);"
	 end
	 system "./configure", *args
	 system "make", "install"
	 if build.with? "server-proxy"
	 db = build.with?("mysql") ? "mysql" : "postgresql"
	 pkgshare.install "frontends/php", "database/#{db}"
	 end
