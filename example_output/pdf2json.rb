name :
	 Pdf2json
homepage :
	 https://github.com/flexpaper/pdf2json
url :
	 https://github.com/flexpaper/pdf2json/releases/download/v0.69/pdf2json-0.69.tar.gz
description :
	 PDF to JSON and XML converter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
	 bin.install "src/pdf2json"
