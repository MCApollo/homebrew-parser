name :
	 Aqbanking
homepage :
	 https://www.aquamaniac.de/sites/aqbanking/
url :
	 https://www.aquamaniac.de/sites/download/download.php?package=03&release=217&file=02&dummy=aqbanking-5.7.8.tar.gz
description :
	 Generic online banking interface
build_deps :
	 pkg-config
link_deps :
	 gettext
	 gmp
	 gwenhywfar
	 ktoblzcheck
	 libxml2
	 libxmlsec1
	 libxslt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "autoreconf", "-fiv" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-cli",
	 "--with-gwen-dir=#{HOMEBREW_PREFIX}"
	 system "make", "check"
	 system "make", "install"
