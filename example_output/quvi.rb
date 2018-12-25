name :
	 Quvi
homepage :
	 https://quvi.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/quvi/0.4/quvi/quvi-0.4.2.tar.bz2
description :
	 Parse video download URLs
build_deps :
	 pkg-config
link_deps :
	 libquvi
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
