name :
	 Zdelta
homepage :
	 https://web.archive.org/web/20150804051750/cis.poly.edu/zdelta/
url :
	 https://web.archive.org/web/20150804051752/cis.poly.edu/zdelta/downloads/zdelta-2.1.tar.gz
description :
	 Lossless delta compression library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "test", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 system "make", "install", "prefix=#{prefix}"
	 bin.install "zdc", "zdu"
