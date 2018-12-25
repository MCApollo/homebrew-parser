name :
	 Boost
homepage :
	 https://www.boost.org/
url :
	 https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
description :
	 Collection of portable C++ source libraries
build_deps :
link_deps :
optional_deps :
	 icu4c
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 end
	 bootstrap_args = ["--prefix=#{prefix}", "--libdir=#{lib}"]
	 if build.with? "icu4c"
	 icu4c_prefix = Formula["icu4c"].opt_prefix
	 bootstrap_args << "--with-icu=#{icu4c_prefix}"
	 else
	 bootstrap_args << "--without-icu"
	 end
	 without_libraries = ["python", "mpi"]
	 without_libraries << "log" if ENV.compiler == :gcc
	 bootstrap_args << "--without-libraries=#{without_libraries.join(",")}"
	 args = ["--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 "-d2",
	 "-j#{ENV.make_jobs}",
	 "--layout=tagged",
	 "--user-config=user-config.jam",
	 "-sNO_LZMA=1",
	 "install"]
	 if build.with? "single"
	 args << "threading=multi,single"
	 else
	 args << "threading=multi"
	 end
	 if build.with? "static"
	 args << "link=shared,static"
	 else
	 args << "link=shared"
	 end
	 args << "cxxflags=-std=c++14"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 system "./bootstrap.sh", *bootstrap_args
	 system "./b2", "headers"
	 system "./b2", *args
