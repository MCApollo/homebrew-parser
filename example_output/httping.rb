name :
	 Httping
homepage :
	 https://www.vanheusden.com/httping/
url :
	 https://www.vanheusden.com/httping/httping-2.5.tgz
description :
	 Ping-like tool for HTTP requests
build_deps :
link_deps :
	 gettext
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace %w[configure Makefile], "ncursesw", "ncurses"
	 ENV.append "LDFLAGS", "-lintl"
	 inreplace "Makefile", "cp nl.mo $(DESTDIR)/$(PREFIX)/share/locale/nl/LC_MESSAGES/httping.mo", ""
	 system "make", "install", "PREFIX=#{prefix}"
