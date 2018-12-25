name :
	 Figlet
homepage :
	 http://www.figlet.org/
url :
	 ftp://ftp.figlet.org/pub/figlet/program/unix/figlet-2.2.5.tar.gz
description :
	 Banner-like program prints strings as ASCII art
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['contrib', 'intl']
	 ['ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz', 'ftp://ftp.figlet.org/pub/figlet/fonts/international.tar.gz']
patches :
EOF_patch :
install :
	 (pkgshare/"fonts").install resource("contrib"), resource("intl")
	 chmod 0666, %w[Makefile showfigfonts]
	 man6.mkpath
	 bin.mkpath
	 system "make", "prefix=#{prefix}",
	 "DEFAULTFONTDIR=#{pkgshare}/fonts",
	 "MANDIR=#{man}",
	 "install"
