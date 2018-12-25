name :
	 Gaffitter
homepage :
	 https://gaffitter.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gaffitter/gaffitter/1.0.0/gaffitter-1.0.0.tar.gz
description :
	 Efficiently fit files/folders to fixed size volumes (like DVDs)
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
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
