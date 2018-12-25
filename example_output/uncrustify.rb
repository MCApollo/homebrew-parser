name :
	 Uncrustify
homepage :
	 https://uncrustify.sourceforge.io/
url :
	 https://github.com/uncrustify/uncrustify/archive/uncrustify-0.68.1.tar.gz
description :
	 Source code beautifier
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
	 doc.install (buildpath/"documentation").children
