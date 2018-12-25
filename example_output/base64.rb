name :
	 Base64
homepage :
	 https://www.fourmilab.ch/webtools/base64/
url :
	 https://www.fourmilab.ch/webtools/base64/base64-1.5.tar.gz
description :
	 Encode and decode base64 files
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking"
	 system "make"
	 bin.install "base64"
	 man1.install "base64.1"
