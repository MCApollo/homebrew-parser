name :
	 Ats2Postiats
homepage :
	 http://www.ats-lang.org/
url :
	 https://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-0.3.11/ATS2-Postiats-0.3.11.tgz
description :
	 Programming language with formal specification features
build_deps :
link_deps :
	 gmp
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "all", "install"
