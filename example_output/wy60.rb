name :
	 Wy60
homepage :
	 https://code.google.com/archive/p/wy60/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/wy60/wy60-2.0.9.tar.gz
description :
	 Wyse 60 compatible terminal emulator
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
	 system "make", "install"
