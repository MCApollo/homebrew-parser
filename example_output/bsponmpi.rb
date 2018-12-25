name :
	 Bsponmpi
homepage :
	 https://sourceforge.net/projects/bsponmpi/
url :
	 https://downloads.sourceforge.net/project/bsponmpi/bsponmpi/0.3/bsponmpi-0.3.tar.gz
description :
	 Implements the BSPlib standard on top of MPI
build_deps :
	 scons
link_deps :
	 open-mpi
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf "include/CVS"
	 rm_rf "include/tools/CVS"
	 scons "-Q", "mode=release"
	 prefix.install "lib", "include"
