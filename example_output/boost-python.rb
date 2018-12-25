name :
	 BoostPython
homepage :
	 https://www.boost.org/
url :
	 https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
description :
	 C++ library for C++/Python2 interoperability
build_deps :
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 "-d2",
	 "-j#{ENV.make_jobs}",
	 "--layout=tagged",
	 "threading=multi,single",
	 "link=shared,static"]
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 pyver = Language::Python.major_minor_version "python"
	 system "./bootstrap.sh", "--prefix=#{prefix}", "--libdir=#{lib}",
	 "--with-libraries=python", "--with-python=python"
	 system "./b2", "--build-dir=build-python", "--stagedir=stage-python",
	 "python=#{pyver}", *args
	 lib.install Dir["stage-python/lib/*py*"]
	 doc.install Dir["libs/python/doc/*"]
