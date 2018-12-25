name :
	 Qprint
homepage :
	 https://www.fourmilab.ch/webtools/qprint
url :
	 https://www.fourmilab.ch/webtools/qprint/qprint-1.1.tar.gz
description :
	 Encoder and decoder for quoted-printable encoding
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
