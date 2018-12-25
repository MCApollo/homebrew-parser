name :
	 Vpcs
homepage :
	 https://vpcs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/vpcs/0.8/vpcs-0.8-src.tbz
description :
	 Virtual PC simulator for testing IP routing
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
	 cd "src" do
	 system "make", "-f", "Makefile.osx"
	 bin.install "vpcs"
	 end
