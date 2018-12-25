name :
	 Bullet
homepage :
	 https://bulletphysics.org/
url :
	 https://github.com/bulletphysics/bullet3/archive/2.87.tar.gz
description :
	 Physics SDK
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
	 args = std_cmake_args + %W[
	 -DINSTALL_EXTRA_LIBS=ON -DBUILD_UNIT_TESTS=OFF -DBUILD_PYBULLET=OFF
	 -DCMAKE_INSTALL_RPATH=#{lib}
	 ]
	 args << "-DUSE_DOUBLE_PRECISION=ON" if build.with? "double-precision"
	 args_shared = args.dup + %w[
	 -DBUILD_BULLET2_DEMOS=OFF -DBUILD_SHARED_LIBS=ON
	 ]
	 args_framework = %W[
	 -DFRAMEWORK=ON
	 -DCMAKE_INSTALL_PREFIX=#{frameworks}
	 -DCMAKE_INSTALL_NAME_DIR=#{frameworks}
	 ]
	 args_shared += args_framework if build.with? "framework"
	 args_static = args.dup << "-DBUILD_SHARED_LIBS=OFF"
	 if build.without? "demo"
	 args_static << "-DBUILD_BULLET2_DEMOS=OFF"
	 else
	 args_static << "-DBUILD_BULLET2_DEMOS=ON"
	 end
	 mkdir "build" do
	 system "cmake", "..", *args_shared
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", "..", *args_static
	 system "make", "install"
	 if build.with? "demo"
	 rm_rf Dir["examples/**/Makefile", "examples/**/*.cmake", "examples/**/CMakeFiles"]
	 pkgshare.install "examples"
	 (pkgshare/"examples").install "../data"
	 end
	 end
