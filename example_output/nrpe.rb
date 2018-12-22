name :
	 Nrpe
homepage :
	 https://www.nagios.org/
url :
	 https://downloads.sourceforge.net/project/nagios/nrpe-3.x/nrpe-3.2.1.tar.gz
description :
	 Nagios remote plugin executor
build_deps :
link_deps :
	 nagios-plugins
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 user  = `id -un`.chomp
	 group = `id -gn`.chomp
	 system "./configure", "--prefix=#{prefix}",
	 "--libexecdir=#{HOMEBREW_PREFIX}/sbin",
	 "--with-piddir=#{var}/run",
	 "--sysconfdir=#{etc}",
	 "--with-nrpe-user=#{user}",
	 "--with-nrpe-group=#{group}",
	 "--with-nagios-user=#{user}",
	 "--with-nagios-group=#{group}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--with-ssl-lib=#{Formula["openssl"].opt_lib}",
	 "--enable-ssl",
	 "--enable-command-args"
	 inreplace "src/Makefile" do |s|
	 s.gsub! "$(LIBEXECDIR)", "$(SBINDIR)"
	 s.gsub! "$(DESTDIR)/usr/local/sbin", "$(SBINDIR)"
	 end
	 system "make", "all"
	 system "make", "install", "install-config"
	 (var/"run").mkpath
