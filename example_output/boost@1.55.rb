name :
	 BoostAT155
homepage :
	 https://www.boost.org
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.bz2
description :
	 Collection of portable C++ source libraries
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/boostorg/atomic/commit/6bb71fdd.diff?full_index=1
	 https://github.com/boostorg/atomic/commit/e4bde20f.diff?full_index=1
	 https://github.com/boostorg/chrono/commit/143260d.diff?full_index=1
EOF_patch :
install :
	 inreplace "boost/archive/iterators/transform_width.hpp",
	 "#include <boost/iterator/iterator_traits.hpp>",
	 "#include <boost/iterator/iterator_traits.hpp>\n#include <algorithm>"
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 end
	 bargs = %W[--prefix=#{prefix} --libdir=#{lib} --without-icu]
	 without_libraries = ["mpi", "python"]
	 without_libraries << "log" if ENV.compiler == :gcc
	 bargs << "--without-libraries=#{without_libraries.join(",")}"
	 args = %W[
	 --prefix=#{prefix}
	 --libdir=#{lib}
	 -d2
	 -j#{ENV.make_jobs}
	 --layout=tagged
	 --user-config=user-config.jam
	 install
	 threading=multi,single
	 link=shared,static
	 ]
	 if build.cxx11?
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 end
	 system "./bootstrap.sh", *bargs
	 system "./b2", *args
