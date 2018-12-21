name :
	 BoostPythonAT159
homepage :
	 https://www.boost.org
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2
description :
	 C++ library for C++/Python interoperability
build_deps :
link_deps :
	 python@2
	 python
	 boost@1.59
	 boost@1.59
conflicts :
patches :
EOF_patch :
install :
	 inreplace "boost/python/data_members.hpp",
	 "
	 "
	 args = ["--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 "-d2",
	 "-j#{ENV.make_jobs}",
	 "--layout=tagged",
	 "--user-config=user-config.jam",
	 "threading=multi,single",
	 "link=shared,static"]
	 if build.cxx11?
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
