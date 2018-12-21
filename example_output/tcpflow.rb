name :
	 Tcpflow
homepage :
	 https://github.com/simsong/tcpflow
url :
	 https://digitalcorpora.org/downloads/tcpflow/tcpflow-1.5.0.tar.gz
description :
	 TCP flow recorder
build_deps :
	 boost
link_deps :
	 openssl
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 system "bash", "./bootstrap.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
