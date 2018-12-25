name :
	 Atf
homepage :
	 https://github.com/jmmv/atf
url :
	 https://github.com/jmmv/atf/releases/download/atf-0.21/atf-0.21.tar.gz
description :
	 ATF: Automated Testing Framework
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
