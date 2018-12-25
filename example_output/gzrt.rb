name :
	 Gzrt
homepage :
	 https://www.urbanophile.com/arenn/coding/gzrt/gzrt.html
url :
	 https://www.urbanophile.com/arenn/coding/gzrt/gzrt-0.8.tar.gz
description :
	 Gzip recovery toolkit
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
	 system "make"
	 bin.install "gzrecover"
	 man1.install "gzrecover.1"
