name :
	 Packmol
homepage :
	 https://www.ime.unicamp.br/~martinez/packmol/
url :
	 https://github.com/leandromartinez98/packmol/archive/18.169.tar.gz
description :
	 Packing optimization for molecular dynamics simulations
build_deps :
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 ['examples']
	 ['https://www.ime.unicamp.br/~martinez/packmol/examples/examples.tar.gz']
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make"
	 bin.install("packmol")
	 pkgshare.install "solvate.tcl"
	 (pkgshare/"examples").install resource("examples")
