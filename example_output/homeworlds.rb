name :
	 Homeworlds
homepage :
	 https://github.com/Quuxplusone/Homeworlds/
url :
	 https://github.com/Quuxplusone/Homeworlds.git
description :
	 C++ framework for the game of Binary Homeworlds
build_deps :
link_deps :
	 wxmac
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "wxgui" => "homeworlds-wx", "annotate" => "homeworlds-cli"
