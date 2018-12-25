name :
	 Ncompress
homepage :
	 https://github.com/vapier/ncompress
url :
	 https://github.com/vapier/ncompress/archive/v4.2.4.4.tar.gz
description :
	 Fast, simple LZW file compressor
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
	 system "make", "install", "BINDIR=#{bin}", "MANDIR=#{man1}"
