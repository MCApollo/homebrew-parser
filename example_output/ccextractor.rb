name :
	 Ccextractor
homepage :
	 https://www.ccextractor.org/
url :
	 https://github.com/CCExtractor/ccextractor/archive/v0.87.tar.gz
description :
	 Free, GPL licensed closed caption tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "mac" do
	 system "./build.command"
	 bin.install "ccextractor"
