name :
	 NagiosPlugins
homepage :
	 https://www.nagios-plugins.org/
url :
	 https://www.nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
description :
	 Plugins for the nagios network monitoring system
build_deps :
link_deps :
	 openssl
	 mysql
	 postgresql
conflicts :
	 monitoring-plugins
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{libexec}
	 --libexecdir=#{libexec}/sbin
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 ]
	 args << "--with-pgsql=#{Formula["postgresql"].opt_prefix}" if build.with? "postgresql"
	 system "./configure", *args
	 system "make", "install"
	 sbin.write_exec_script Dir["#{libexec}/sbin/*"]
