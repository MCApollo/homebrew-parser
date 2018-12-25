name :
	 Aspcud
homepage :
	 https://potassco.org/aspcud/
url :
	 https://github.com/potassco/aspcud/archive/v1.9.4.tar.gz
description :
	 Package dependency solver
build_deps :
	 boost
	 cmake
	 re2c
link_deps :
	 clingo
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DASPCUD_GRINGO_PATH=#{Formula["clingo"].opt_bin}/gringo"
	 args << "-DASPCUD_CLASP_PATH=#{Formula["clingo"].opt_bin}/clasp"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
