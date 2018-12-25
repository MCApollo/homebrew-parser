name :
	 PamU2f
homepage :
	 https://developers.yubico.com/pam-u2f/
url :
	 https://developers.yubico.com/pam-u2f/Releases/pam_u2f-1.0.7.tar.gz
description :
	 Provides an easy way to use U2F-compliant authenticators with PAM
build_deps :
	 asciidoc
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libu2f-host
	 libu2f-server
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "--install"
	 ENV["A2X"] = "#{Formula["asciidoc"].opt_bin}/a2x --no-xmllint"
	 system "./configure", "--prefix=#{prefix}", "--with-pam-dir=#{lib}/pam"
	 system "make", "install"
