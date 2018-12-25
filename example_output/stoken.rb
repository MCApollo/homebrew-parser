name :
	 Stoken
homepage :
	 https://stoken.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/stoken/stoken-0.92.tar.gz
description :
	 Tokencode generator compatible with RSA SecurID 128-bit (AES)
build_deps :
	 pkg-config
link_deps :
	 nettle
	 adwaita-icon-theme
	 hicolor-icon-theme
optional_deps :
	 gtk+3
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-debug
	 --disable-silent-rules
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "check"
	 system "make", "install"
