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
	 end
	 if build.with? "libidn"
	 inreplace "src/config.h", "/* #define HAVE_IDN */", "#define HAVE_IDN"
	 ENV.append_to_cflags "-I#{Formula["gettext"].opt_include}"
	 ENV.append "LDFLAGS", "-L#{Formula["gettext"].opt_lib} -lintl"
	 end
	 if build.with? "dnssec"
	 inreplace "src/config.h", "/* #define HAVE_DNSSEC */", "#define HAVE_DNSSEC"
	 inreplace "dnsmasq.conf.example" do |s|
	 s.gsub! "#conf-file=%%PREFIX%%/share/dnsmasq/trust-anchors.conf",
	 "conf-file=#{opt_pkgshare}/trust-anchors.conf"
	 s.gsub! "#dnssec", "dnssec"
	 end
	 end
	 ENV.append_to_cflags "-D__APPLE_USE_RFC_3542" if MacOS.version >= :lion
	 inreplace "Makefile" do |s|
	 s.change_make_var! "CFLAGS", ENV.cflags
	 s.change_make_var! "LDFLAGS", ENV.ldflags
	 end
	 if build.with? "libidn"
	 system "make", "install-i18n", "PREFIX=#{prefix}"
	 else
	 system "make", "install", "PREFIX=#{prefix}"
	 end
	 pkgshare.install "trust-anchors.conf" if build.with? "dnssec"
	 etc.install "dnsmasq.conf.example" => "dnsmasq.conf"
	 (var/"lib/misc/dnsmasq").mkpath
	 (var/"run/dnsmasq").mkpath
	 (etc/"dnsmasq.d/ppp").mkpath
	 (etc/"dnsmasq.d/dhcpc").mkpath
