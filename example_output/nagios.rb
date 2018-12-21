name :
	 Nagios
homepage :
	 https://www.nagios.org/
url :
	 https://downloads.sourceforge.net/project/nagios/nagios-4.x/nagios-4.4.2/nagios-4.4.2.tar.gz
description :
	 Network monitoring and management system
build_deps :
link_deps :
	 gd
	 libpng
	 nagios-plugins
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sbindir=#{nagios_sbin}",
	 "--sysconfdir=#{nagios_etc}",
	 "--localstatedir=#{nagios_var}",
	 "--datadir=#{htdocs}",
	 "--libexecdir=
	 "--with-cgiurl=/nagios/cgi-bin",
	 "--with-htmurl=/nagios",
	 "--with-nagios-user=#{user}",
	 "--with-nagios-group='#{group}'",
	 "--with-command-user=#{user}",
	 "--with-command-group=_www",
	 "--with-httpd-conf=#{share}",
	 "--disable-libtool"
	 system "make", "all"
	 system "make", "install"
	 system "make", "install-config"
	 system "make", "install-webconf"
	 (var/"lib/nagios/rw").mkpath
	 config = etc/"nagios/nagios.cfg"
	 return unless File.exist?(config)
	 return if File.read(config).include?(ENV["USER"])
	 inreplace config, "brew", ENV["USER"]
