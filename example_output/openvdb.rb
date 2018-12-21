name :
	 Openvdb
homepage :
	 http://www.openvdb.org/
url :
	 https://github.com/dreamworksanimation/openvdb/archive/v5.2.0.tar.gz
description :
	 Sparse volume processing toolkit
build_deps :
	 doxygen
link_deps :
	 boost
	 c-blosc
	 glfw
	 ilmbase
	 jemalloc
	 openexr
	 tbb
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = [
	 "DESTDIR=#{prefix}",
	 "BLOSC_INCL_DIR=#{Formula["c-blosc"].opt_include}",
	 "BLOSC_LIB_DIR=#{Formula["c-blosc"].opt_lib}",
	 "BOOST_INCL_DIR=#{Formula["boost"].opt_include}",
	 "BOOST_LIB_DIR=#{Formula["boost"].opt_lib}",
	 "BOOST_THREAD_LIB=-lboost_thread-mt",
	 "CONCURRENT_MALLOC_LIB_DIR=#{Formula["jemalloc"].opt_lib}",
	 "CPPUNIT_INCL_DIR=",
	 "CPPUNIT_LIB_DIR=",
	 "DOXYGEN=doxygen",
	 "EXR_INCL_DIR=#{Formula["openexr"].opt_include}/OpenEXR",
	 "EXR_LIB_DIR=#{Formula["openexr"].opt_lib}",
	 "LOG4CPLUS_INCL_DIR=",
	 "LOG4CPLUS_LIB_DIR=",
	 "NUMPY_INCL_DIR=",
	 "PYTHON_VERSION=",
	 "TBB_INCL_DIR=#{Formula["tbb"].opt_include}",
	 "TBB_LIB_DIR=#{Formula["tbb"].opt_lib}",
	 "GLFW_INCL_DIR=#{Formula["glfw"].opt_include}",
	 "GLFW_LIB_DIR=#{Formula["glfw"].opt_lib}",
	 "GLFW_LIB=-lglfw",
	 ]
	 ENV.append_to_cflags "-I #{buildpath}"
	 cd "openvdb" do
	 system "make", "install", *args
