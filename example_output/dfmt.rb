name :
	 Dfmt
homepage :
	 https://github.com/dlang-community/dfmt
url :
	 https://github.com/dlang-community/dfmt.git
description :
	 Formatter for D source code
build_deps :
	 dmd
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bin/dfmt"
