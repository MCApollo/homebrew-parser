name :
	 Ppl
homepage :
	 https://bugseng.com/ppl
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/p/ppl/ppl_1.2.orig.tar.xz
description :
	 Parma Polyhedra Library: numerical abstractions for analysis, verification
build_deps :
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 http://www.cs.unipr.it/git/gitweb.cgi?p=ppl/ppl.git;a=commitdiff_plain;h=c39f6a07b51f89e365b05ba4147aa2aa448febd7
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-gmp=#{Formula["gmp"].opt_prefix}",
	 "--prefix=#{prefix}"
	 system "make", "install"
