name :
	 DejaGnu
homepage :
	 https://www.gnu.org/software/dejagnu/
url :
	 https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.1.tar.gz
description :
	 Framework for testing other programs
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "autoreconf", "-iv" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "check"
	 system "make", "install"
