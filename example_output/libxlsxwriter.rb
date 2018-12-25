name :
	 Libxlsxwriter
homepage :
	 https://libxlsxwriter.github.io/
url :
	 https://github.com/jmcnamara/libxlsxwriter/archive/RELEASE_0.8.4.tar.gz
description :
	 C library for creating Excel XLSX files
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
	 system "make", "install", "INSTALL_DIR=#{prefix}", "V=1"
