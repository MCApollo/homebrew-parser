name :
	 Lasso
homepage :
	 http://lasso.entrouvert.org/
url :
	 https://dev.entrouvert.org/releases/lasso/lasso-2.6.0.tar.gz
description :
	 Library for Liberty Alliance and SAML protocols
build_deps :
	 pkg-config
link_deps :
	 glib
	 libxmlsec1
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-java",
	 "--disable-perl",
	 "--disable-php5",
	 "--disable-python",
	 "--prefix=#{prefix}",
	 "--with-pkg-config=#{ENV["PKG_CONFIG_PATH"]}"
	 system "make", "install"
