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
conflicts :
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
	 (var/"cache/httpd").mkpath
	 (var/"www").mkpath
