name :
	 Gmsh
homepage :
	 https://gmsh.info/
url :
	 https://gmsh.info/src/gmsh-4.0.7-source.tgz
description :
	 3D finite element grid generator with CAD engine
build_deps :
	 cmake
link_deps :
	 gcc
	 open-mpi
	 fltk
	 cairo
	 opencascade
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DENABLE_OS_SPECIFIC_INSTALL=0
	 -DGMSH_BIN=#{bin}
	 -DGMSH_LIB=#{lib}
	 -DGMSH_DOC=#{pkgshare}/gmsh
	 -DGMSH_MAN=#{man}
	 -DENABLE_BUILD_LIB=ON
	 -DENABLE_BUILD_SHARED=ON
	 -DENABLE_NATIVE_FILE_CHOOSER=ON
	 -DENABLE_PETSC=OFF
	 -DENABLE_SLEPC=OFF
	 ]
	 if build.with? "opencascade"
	 ENV["CASROOT"] = Formula["opencascade"].opt_prefix
	 args << "-DENABLE_OCC=ON"
	 else
	 args << "-DENABLE_OCC=OFF"
	 end
	 args << "-DENABLE_FLTK=OFF" if build.without? "fltk"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 mkdir_p libexec
	 mv bin/"onelab.py", libexec
	 end
