name :
	 Namazu
homepage :
	 http://www.namazu.org/
url :
	 http://www.namazu.org/stable/namazu-2.0.21.tar.gz
description :
	 Full-text search engine
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "File-MMagic" do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 args = ["--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-pmdir=#{libexec}/lib/perl5"]
	 system "./configure", *args
	 system "make", "install"
