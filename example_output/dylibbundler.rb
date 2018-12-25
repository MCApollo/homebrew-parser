name :
	 Dylibbundler
homepage :
	 https://github.com/auriamg/macdylibbundler
url :
	 https://downloads.sourceforge.net/project/macdylibbundler/macdylibbundler/0.4.4/dylibbundler-0.4.4.zip
description :
	 Utility to bundle libraries into executables for macOS
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
	 bin.install "dylibbundler"
