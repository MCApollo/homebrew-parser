name :
	 Stlviewer
homepage :
	 https://github.com/vishpat/stlviewer#readme
url :
	 https://github.com/vishpat/stlviewer/archive/release-0.1.tar.gz
description :
	 View stl files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./compile.py"
	 bin.install "stlviewer"
