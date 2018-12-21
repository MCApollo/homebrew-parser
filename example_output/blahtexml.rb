name :
	 Blahtexml
homepage :
	 http://gva.noekeon.org/blahtexml/
url :
	 http://gva.noekeon.org/blahtexml/blahtexml-0.9-src.tar.gz
description :
	 Converts equations into Math ML
build_deps :
link_deps :
	 xerces-c
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0632225f/blahtexml/patch-mainPng.cpp.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0632225f/blahtexml/patch-main.cpp.diff
EOF_patch :
install :
	 ENV.cxx11
	 system "make", "blahtex-mac"
	 bin.install "blahtex"
	 system "make", "blahtexml-mac"
	 bin.install "blahtexml"
