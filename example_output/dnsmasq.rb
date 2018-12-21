name :
	 Dnsmasq
homepage :
	 http://www.thekelleys.org.uk/dnsmasq/doc.html
url :
	 http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.80.tar.gz
description :
	 Lightweight DNS forwarder and DHCP server
build_deps :
	 pkg-config
link_deps :
	 nettle
	 libidn
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 inreplace %w[dnsmasq.conf.example src/config.h man/dnsmasq.8
	 man/es/dnsmasq.8 man/fr/dnsmasq.8].each do |s|
	 s.gsub! "/var/lib/misc/dnsmasq.leases",
	 var/"lib/misc/dnsmasq/dnsmasq.leases", false
	 s.gsub! "/etc/dnsmasq.conf", etc/"dnsmasq.conf", false
	 s.gsub! "/var/run/dnsmasq.pid", var/"run/dnsmasq/dnsmasq.pid", false
	 s.gsub! "/etc/dnsmasq.d", etc/"dnsmasq.d", false
	 s.gsub! "/etc/ppp/resolv.conf", etc/"dnsmasq.d/ppp/resolv.conf", false
	 s.gsub! "/etc/dhcpc/resolv.conf", etc/"dnsmasq.d/dhcpc/resolv.conf", false
	 s.gsub! "/usr/sbin/dnsmasq", HOMEBREW_PREFIX/"sbin/dnsmasq", false
	 (var/"lib/misc/dnsmasq").mkpath
	 (var/"run/dnsmasq").mkpath
	 (etc/"dnsmasq.d/ppp").mkpath
	 (etc/"dnsmasq.d/dhcpc").mkpath
