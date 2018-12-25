name :
	 Dcd
homepage :
	 https://github.com/dlang-community/DCD
url :
	 https://github.com/dlang-community/DCD.git
description :
	 Auto-complete program for the D programming language
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
	 system "make"
	 bin.install "bin/dcd-client", "bin/dcd-server"
