name :
	 Freeling
homepage :
	 http://nlp.lsi.upc.edu/freeling/
url :
	 https://github.com/TALP-UPC/FreeLing/releases/download/4.1/FreeLing-4.1.tar.gz
description :
	 Suite of language analyzers
build_deps :
	 cmake
link_deps :
	 icu4c
conflicts :
	 hunspell
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
