name :
	 BoostMpi
homepage :
	 https://www.boost.org/
url :
	 https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
description :
	 C++ library for C++/MPI interoperability
build_deps :
link_deps :
	 boost
	 open-mpi
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
	 "--user-config=user-config.jam",
	 "threading=multi,single",
	 "link=shared,static"]
	 args << "cxxflags=-std=c++11"
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 file.write "using mpi ;\n"
	 end
	 system "./bootstrap.sh", "--prefix=#{prefix}", "--libdir=#{lib}", "--with-libraries=mpi"
	 system "./b2", *args
	 lib.install Dir["stage/lib/*mpi*"]
	 boost = Formula["boost"]
	 MachO::Tools.change_install_name("#{lib}/libboost_mpi-mt.dylib",
	 "libboost_serialization-mt.dylib",
	 "#{boost.lib}/libboost_serialization-mt.dylib")
	 MachO::Tools.change_install_name("#{lib}/libboost_mpi.dylib",
	 "libboost_serialization.dylib",
	 "#{boost.lib}/libboost_serialization.dylib")
