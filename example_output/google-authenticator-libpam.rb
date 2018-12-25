name :
	 GoogleAuthenticatorLibpam
homepage :
	 https://github.com/google/google-authenticator-libpam
url :
	 https://github.com/google/google-authenticator-libpam/archive/1.05.tar.gz
description :
	 PAM module for two-factor authentication
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 qrencode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
