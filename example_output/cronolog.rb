name :
	 Cronolog
homepage :
	 https://web.archive.org/web/20140209202032/cronolog.org/
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/cronolog/cronolog-1.6.2.tar.gz
description :
	 Web log rotation
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}"
	 system "make", "install"
