name :
	 ReginaRexx
homepage :
	 https://regina-rexx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/regina-rexx/regina-rexx/3.9.1/Regina-REXX-3.9.1.tar.gz
description :
	 Regina REXX interpreter
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
	 ENV.deparallelize
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}"
	 system "make", "install"
