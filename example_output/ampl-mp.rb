name :
	 AmplMp
homepage :
	 https://www.ampl.com/
url :
	 https://github.com/ampl/mp/archive/3.1.0.tar.gz
description :
	 The AMPL modeling language solver library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DBUILD_SHARED_LIBS=True"
	 system "make", "all"
	 MachO::Tools.change_install_name("bin/libasl.dylib", "@rpath/libmp.3.dylib",
	 "#{opt_lib}/libmp.dylib")
	 system "make", "install"
	 mkdir_p libexec/"bin"
	 mv Dir[bin/"*.dll"], libexec/"bin"
	 %w[errchk.h jac2dim.h obj_adj.h].each { |h| cp "src/asl/solvers/#{h}", include/"asl" }
	 resource("miniampl").stage do
	 (pkgshare/"example").install "src/miniampl.c", Dir["examples/wb.*"]
