name :
	 Vnstat
homepage :
	 https://humdi.net/vnstat/
url :
	 https://humdi.net/vnstat/vnstat-1.18.tar.gz
description :
	 Console-based network traffic monitor
build_deps :
link_deps :
	 gd
conflicts :
patches :
EOF_patch :
install :
	 inreplace %w[src/cfg.c src/common.h man/vnstat.1 man/vnstatd.1 man/vnstati.1
	 man/vnstat.conf.5].each do |s|
	 s.gsub! "/etc/vnstat.conf", "#{etc}/vnstat.conf", false
	 s.gsub! "/var/", "#{var}/", false
	 s.gsub! "var/lib", "var/db", false
	 s.gsub! "\"eth0\"", "\"en0\"", false
	 (var/"db/vnstat").mkpath
	 (var/"log/vnstat").mkpath
	 (var/"run/vnstat").mkpath
