name :
	 Io
homepage :
	 http://iolanguage.com/
url :
	 https://github.com/stevedekorte/io/archive/2017.09.06.tar.gz
description :
	 Small prototype-based programming language
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
	 cairo
	 gmp
	 jpeg
	 libevent
	 libffi
	 libogg
	 libpng
	 libsndfile
	 libtiff
	 libvorbis
	 ossp-uuid
	 pcre
	 yajl
	 xz
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.append_to_cflags "-fobjc-exceptions"
	 if build.without? "addons"
	 inreplace "CMakeLists.txt", "add_subdirectory(addons)",
	 "#add_subdirectory(addons)"
	 else
	 inreplace "addons/CMakeLists.txt" do |s|
	 if build.without? "python"
	 s.gsub! "add_subdirectory(Python)", "#add_subdirectory(Python)"
	 end
	 s.gsub!(/(add_subdirectory\(Font\))/, '#\1')
	 s.gsub!(/(add_subdirectory\(Memcached\))/, '#\1')
	 end
	 end
	 mkdir "buildroot" do
	 system "cmake", "..", "-DCMAKE_DISABLE_FIND_PACKAGE_ODE=ON",
	 "-DCMAKE_DISABLE_FIND_PACKAGE_Theora=ON",
	 *std_cmake_args
	 system "make"
	 output = `./_build/binaries/io ../libs/iovm/tests/correctness/run.io`
	 if $CHILD_STATUS.exitstatus.nonzero?
	 opoo "Test suite not 100% successful:\n#{output}"
	 else
	 ohai "Test suite ran successfully:\n#{output}"
	 end
	 system "make", "install"
	 end
