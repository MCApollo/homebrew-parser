name :
	 Qstat
homepage :
	 https://qstat.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/qstat/qstat/qstat-2.11/qstat-2.11.tar.gz
description :
	 Query Quake servers from the command-line
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
