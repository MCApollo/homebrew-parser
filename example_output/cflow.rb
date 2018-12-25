name :
	 Cflow
homepage :
	 https://www.gnu.org/software/cflow/
url :
	 https://ftp.gnu.org/gnu/cflow/cflow-1.5.tar.bz2
description :
	 Generate call graphs from C code
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
	 "--infodir=#{info}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--with-lispdir=#{elisp}"
	 system "make", "install"
