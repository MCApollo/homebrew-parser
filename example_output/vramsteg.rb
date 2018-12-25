name :
	 Vramsteg
homepage :
	 https://gothenburgbitfactory.org/projects/vramsteg.html
url :
	 https://gothenburgbitfactory.org/download/vramsteg-1.1.0.tar.gz
description :
	 Add progress bars to command-line applications
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
