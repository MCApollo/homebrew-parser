name :
	 Sgrep
homepage :
	 https://www.cs.helsinki.fi/u/jjaakkol/sgrep.html
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/sgrep2/sgrep-1.94a.tar.gz
description :
	 Search SGML, XML, and HTML
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
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--datadir=#{pkgshare}"
	 system "make", "install"
