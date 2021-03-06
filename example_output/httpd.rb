name :
	 Httpd
homepage :
	 https://httpd.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=httpd/httpd-2.4.37.tar.bz2
description :
	 Apache HTTP server
build_deps :
link_deps :
	 apr
	 apr-util
	 brotli
	 nghttp2
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile.in",
	 '#@@ServerRoot@@#$(prefix)#', '#@@ServerRoot@@'"##{opt_prefix}#"
	 inreplace "docs/conf/extra/httpd-autoindex.conf.in",
	 "@exp_iconsdir@", "#{opt_pkgshare}/icons"
	 inreplace "docs/conf/extra/httpd-multilang-errordoc.conf.in",
	 "@exp_errordir@", "#{opt_pkgshare}/error"
	 inreplace "docs/conf/httpd.conf.in", /(User|Group) daemon/, "\\1 _www"
	 inreplace "config.layout" do |s|
	 s.gsub! "${datadir}/htdocs", "${datadir}"
	 s.gsub! "${htdocsdir}/manual", "#{pkgshare}/manual"
	 s.gsub! "${datadir}/error",   "#{pkgshare}/error"
	 s.gsub! "${datadir}/icons",   "#{pkgshare}/icons"
	 end
	 system "./configure", "--enable-layout=Slackware-FHS",
	 "--prefix=#{prefix}",
	 "--sbindir=#{bin}",
	 "--mandir=#{man}",
	 "--sysconfdir=#{etc}/httpd",
	 "--datadir=#{var}/www",
	 "--localstatedir=#{var}",
	 "--enable-mpms-shared=all",
	 "--enable-mods-shared=all",
	 "--enable-authnz-fcgi",
	 "--enable-cgi",
	 "--enable-pie",
	 "--enable-suexec",
	 "--with-suexec-bin=#{opt_bin}/suexec",
	 "--with-suexec-caller=_www",
	 "--with-port=8080",
	 "--with-sslport=8443",
	 "--with-apr=#{Formula["apr"].opt_prefix}",
	 "--with-apr-util=#{Formula["apr-util"].opt_prefix}",
	 "--with-brotli=#{Formula["brotli"].opt_prefix}",
	 "--with-libxml2=#{MacOS.sdk_path_if_needed}/usr",
	 "--with-mpm=prefork",
	 "--with-nghttp2=#{Formula["nghttp2"].opt_prefix}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--with-pcre=#{Formula["pcre"].opt_prefix}",
	 "--with-z=#{MacOS.sdk_path_if_needed}/usr",
	 "--disable-lua",
	 "--disable-luajit"
	 system "make"
	 system "make", "install"
	 bin.install "support/suexec"
	 rm bin/"envvars"
	 rm bin/"envvars-std"
	 inreplace %W[
	 #{include}/httpd/ap_config_layout.h
	 #{lib}/httpd/build/config_vars.mk
	 ] do |s|
	 s.gsub! "#{lib}/httpd/modules", "#{HOMEBREW_PREFIX}/lib/httpd/modules"
	 end
	 inreplace %W[
	 #{bin}/apachectl
	 #{bin}/apxs
	 #{include}/httpd/ap_config_auto.h
	 #{include}/httpd/ap_config_layout.h
	 #{lib}/httpd/build/config_vars.mk
	 #{lib}/httpd/build/config.nice
	 ] do |s|
	 s.gsub! prefix, opt_prefix
	 end
	 inreplace "#{lib}/httpd/build/config_vars.mk" do |s|
	 pcre = Formula["pcre"]
	 s.gsub! pcre.prefix.realpath, pcre.opt_prefix
	 s.gsub! "${prefix}/lib/httpd/modules",
	 "#{HOMEBREW_PREFIX}/lib/httpd/modules"
	 end
	 (var/"cache/httpd").mkpath
	 (var/"www").mkpath
