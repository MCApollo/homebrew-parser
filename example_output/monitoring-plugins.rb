name :
	 MonitoringPlugins
homepage :
	 https://www.monitoring-plugins.org
url :
	 https://www.monitoring-plugins.org/download/monitoring-plugins-2.2.tar.gz
description :
	 Plugins for nagios compatible monitoring systems
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
	 nagios-plugins
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{libexec}
	 --libexecdir=#{libexec}/sbin
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
	 sbin.write_exec_script Dir["#{libexec}/sbin/*"]
