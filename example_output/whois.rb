name :
	 Whois
homepage :
	 https://packages.debian.org/sid/whois
url :
	 https://deb.debian.org/debian/pool/main/w/whois/whois_5.4.0.tar.xz
description :
	 Lookup tool for domain names and other internet resources
build_deps :
link_deps :
	 pkg-config
optional_deps :
	 libidn2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-L/usr/lib -liconv"
	 system "make", "whois", "HAVE_ICONV=1"
	 bin.install "whois"
	 man1.install "whois.1"
	 man5.install "whois.conf.5"
