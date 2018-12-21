name :
	 TokyoCabinet
homepage :
	 https://fallabs.com/tokyocabinet/
url :
	 https://fallabs.com/tokyocabinet/tokyocabinet-1.4.48.tar.gz
description :
	 Lightweight database library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
