name :
	 Djbdns
homepage :
	 https://cr.yp.to/djbdns.html
url :
	 https://cr.yp.to/djbdns/djbdns-1.05.tar.gz
description :
	 D.J. Bernstein's DNS tools
build_deps :
link_deps :
	 daemontools
	 ucspi-tcp
conflicts :
patches :
EOF_patch :
install :
	 inreplace "hier.c", 'c("/"', "c(auto_home"
	 inreplace "dnscache-conf.c", "/etc/dnsroots", "#{etc}/dnsroots"
	 rm %w[conf-home conf-ld conf-cc]
	 (buildpath/"conf-home").write prefix
	 (buildpath/"conf-ld").write "gcc"
	 if MacOS.sdk_path_if_needed
	 (buildpath/"conf-cc").write "gcc -O2 -include #{MacOS.sdk_path}/usr/include/errno.h"
	 else
	 (buildpath/"conf-cc").write "gcc -O2 -include /usr/include/errno.h"
