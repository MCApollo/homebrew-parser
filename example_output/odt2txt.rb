name :
	 Odt2txt
homepage :
	 https://github.com/dstosberg/odt2txt/
url :
	 https://github.com/dstosberg/odt2txt/archive/v0.5.tar.gz
description :
	 Convert OpenDocument files to plain text
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['sample']
	 ['https://github.com/Turbo87/odt2txt/raw/samples/samples/sample-1.odt']
patches :
EOF_patch :
install :
	 system "make", "install", "DESTDIR=#{prefix}"
