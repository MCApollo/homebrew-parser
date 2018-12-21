name :
	 GnuProlog
homepage :
	 http://www.gprolog.org/
url :
	 http://www.gprolog.org/gprolog-1.4.5.tar.gz
description :
	 Prolog compiler with constraint solving
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "./configure", "--prefix=#{prefix}", "--with-doc-dir=#{doc}"
	 ENV.deparallelize
	 system "make"
	 system "make", "install"
