name :
	 Glog
homepage :
	 https://github.com/google/glog
url :
	 https://github.com/google/glog/archive/v0.3.5.tar.gz
description :
	 Application-level logging library
build_deps :
	 cmake
link_deps :
	 gflags
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
	 end
	 (lib/"pkgconfig/libglog.pc").write <<~EOS
	 prefix=#{prefix}
	 exec_prefix=${prefix}
	 libdir=${exec_prefix}/lib
	 includedir=${prefix}/include
	 Name: libglog
	 Description: Google Log (glog) C++ logging framework
	 Version: #{stable.version}
	 Libs: -L${libdir} -lglog
	 Cflags: -I${includedir}
	 EOS
