name :
	 Partio
homepage :
	 https://github.com/wdas/partio
url :
	 https://github.com/wdas/partio/archive/v1.1.0.tar.gz
description :
	 Particle library for 3D graphics
build_deps :
	 cmake
	 doxygen
	 swig
link_deps :
conflicts :
patches :
	 https://github.com/wdas/partio/commit/5b80b00ddedaef9ffed19ea4e6773ed1dc27394e.diff?full_index=1
	 https://github.com/wdas/partio/commit/bdce60e316b699fb4fd813c6cad9d369205657c8.diff?full_index=1
	 https://github.com/wdas/partio/commit/e557c212b0e8e0c4830e7991541686d568853afd.diff?full_index=1
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "doc"
	 system "make", "install"
	 end
