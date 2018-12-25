name :
	 Waon
homepage :
	 https://kichiki.github.io/WaoN/
url :
	 https://github.com/kichiki/WaoN/archive/v0.11.tar.gz
description :
	 Wave-to-notes transcriber
build_deps :
	 pkg-config
link_deps :
	 fftw
	 libsndfile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "-f", "Makefile.waon", "waon"
	 bin.install "waon"
	 man1.install "waon.1"
