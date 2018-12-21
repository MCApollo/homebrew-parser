name :
	 Slrn
homepage :
	 https://slrn.sourceforge.io/
url :
	 https://jedsoft.org/releases/slrn/slrn-1.0.3a.tar.bz2
description :
	 Powerful console-based newsreader
build_deps :
link_deps :
	 openssl
	 s-lang
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 mkdir_p "#{var}/spool/news/slrnpull"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--with-slrnpull=#{var}/spool/news/slrnpull",
	 "--with-slang=#{HOMEBREW_PREFIX}"
	 system "make", "all", "slrnpull"
	 ENV.deparallelize
	 system "make", "install"
