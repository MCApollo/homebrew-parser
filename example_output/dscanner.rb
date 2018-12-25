name :
	 Dscanner
homepage :
	 https://github.com/dlang-community/Dscanner
url :
	 https://github.com/dlang-community/Dscanner.git
description :
	 Analyses e.g. the style and syntax of D code
build_deps :
	 dmd
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "dmdbuild"
	 bin.install "bin/dscanner"
