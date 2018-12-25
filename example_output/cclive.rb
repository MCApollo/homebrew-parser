name :
	 Cclive
homepage :
	 https://cclive.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cclive/0.7/cclive-0.7.16.tar.xz
description :
	 Command-line video extraction utility
build_deps :
	 pkg-config
link_deps :
	 boost
	 pcre
	 quvi
optional_deps :
conflicts :
	 clozure-cl
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
