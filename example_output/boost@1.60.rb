name :
	 BoostAT160
homepage :
	 https://www.boost.org/
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.bz2
description :
	 Collection of portable C++ source libraries
build_deps :
link_deps :
	 icu4c
	 icu4c
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/9e56b45/boost/boost1_60_0_python_class_metadata.diff
EOF_patch :
	 diff -Nur boost_1_60_0/boost/graph/adjacency_matrix.hpp boost_1_60_0-patched/boost/graph/adjacency_matrix.hpp
	 --- boost_1_60_0/boost/graph/adjacency_matrix.hpp	2015-10-23 05:50:19.000000000 -0700
	 +++ boost_1_60_0-patched/boost/graph/adjacency_matrix.hpp	2016-01-19 14:03:29.000000000 -0800
	 @@ -443,7 +443,7 @@
	 // graph type. Instead, use directedS, which also provides the
	 // functionality required for a Bidirectional Graph (in_edges,
	 // in_degree, etc.).
	 -    BOOST_STATIC_ASSERT(type_traits::ice_not<(is_same<Directed, bidirectionalS>::value)>::value);
	 +    BOOST_STATIC_ASSERT(!(is_same<Directed, bidirectionalS>::value));
	 typedef typename mpl::if_<is_directed,
	 bidirectional_tag, undirected_tag>::type
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
