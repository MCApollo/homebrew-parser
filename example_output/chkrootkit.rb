name :
	 Chkrootkit
homepage :
	 http://www.chkrootkit.org/
url :
	 ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit-0.52.tar.gz
description :
	 Rootkit detector
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}",
	 "STATIC=", "sense", "all"
	 bin.install Dir[buildpath/"*"].select { |f| File.executable? f }
	 doc.install %w[README README.chklastlog README.chkwtmp]
