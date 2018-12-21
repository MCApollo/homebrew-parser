name :
	 Folly
homepage :
	 https://github.com/facebook/folly
url :
	 https://github.com/facebook/folly/archive/v2018.09.24.00.tar.gz
description :
	 Collection of reusable C++ library artifacts developed at Facebook
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 double-conversion
	 gflags
	 glog
	 libevent
	 lz4
	 :macos
	 openssl
	 snappy
	 xz
	 zstd
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "_build" do
	 args = std_cmake_args + %w[
	 -DFOLLY_USE_JEMALLOC=OFF
	 ]
	 args << "-DCOMPILER_HAS_F_ALIGNED_NEW=OFF" if MacOS.version == :sierra
	 system "cmake", "..", *args, "-DBUILD_SHARED_LIBS=ON"
	 system "make"
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", "..", *args, "-DBUILD_SHARED_LIBS=OFF"
	 system "make"
	 lib.install "libfolly.a", "folly/libfollybenchmark.a"
