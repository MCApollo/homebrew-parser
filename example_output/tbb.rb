name :
	 Tbb
homepage :
	 https://www.threadingbuildingblocks.org/
url :
	 https://github.com/01org/tbb/archive/2019_U3.tar.gz
description :
	 Rich and complete approach to parallelism in C++
build_deps :
	 cmake
	 swig
link_deps :
	 :macos
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 compiler = (ENV.compiler == :clang) ? "clang" : "gcc"
	 system "make", "tbb_build_prefix=BUILDPREFIX", "compiler=#{compiler}"
	 lib.install Dir["build/BUILDPREFIX_release/*.dylib"]
	 system "make", "tbb_build_prefix=BUILDPREFIX", "compiler=#{compiler}",
	 "extra_inc=big_iron.inc"
	 lib.install Dir["build/BUILDPREFIX_release/*.a"]
	 include.install "include/tbb"
	 cd "python" do
	 ENV["TBBROOT"] = prefix
	 system "python", *Language::Python.setup_install_args(prefix)
	 end
	 system "cmake", "-DTBB_ROOT=#{prefix}",
	 "-DTBB_OS=Darwin",
	 "-DSAVE_TO=lib/cmake/TBB",
	 "-P", "cmake/tbb_config_generator.cmake"
	 (lib/"cmake"/"TBB").install Dir["lib/cmake/TBB/*.cmake"]
