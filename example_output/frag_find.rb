name :
	 FragFind
homepage :
	 https://github.com/simsong/frag_find
url :
	 https://digitalcorpora.org/downloads/frag_find/frag_find-1.0.0.tar.gz
description :
	 Hash-based carver tool (formerly 'NPS Bloom Filter package')
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 inreplace "bootstrap.sh", "./configure", ""
	 system "./bootstrap.sh"
