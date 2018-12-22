name :
	 BoostAT159
homepage :
	 https://www.boost.org
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2
description :
	 Collection of portable C++ source libraries
build_deps :
link_deps :
	 icu4c
	 icu4c
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2ccb6715b3/boost/boost159-questionable-operator.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2ccb6715b3/boost/boost159-missing-symbols.patch
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
	 if build.cxx11?
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 end
	 system "./bootstrap.sh", *bootstrap_args
	 system "./b2", "headers"
	 system "./b2", *args
