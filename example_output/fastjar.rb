name :
	 Fastjar
homepage :
	 https://sourceforge.net/projects/fastjar/
url :
	 https://downloads.sourceforge.net/project/fastjar/fastjar/0.94/fastjar-0.94.tar.gz
description :
	 Implementation of Sun's jar tool
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
