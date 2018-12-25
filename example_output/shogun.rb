name :
	 Shogun
homepage :
	 http://www.shogun-toolbox.org/
url :
	 http://shogun-toolbox.org/archives/shogun/releases/6.1/sources/shogun-6.1.3.tar.bz2
description :
	 Large scale machine learning toolbox
build_deps :
	 cmake
	 pkg-config
	 swig
link_deps :
	 :java
	 arpack
	 eigen
	 glpk
	 hdf5
	 json-c
	 lapack
	 lzo
	 nlopt
	 python@2
	 snappy
	 xz
optional_deps :
conflicts :
resource :
	 ['jblas', 'numpy']
	 ['https://mikiobraun.github.io/jblas/jars/jblas-1.2.3.jar', 'https://files.pythonhosted.org/packages/ee/66/7c2690141c520db08b6a6f852fa768f421b0b50683b7bbcd88ef51f33170/numpy-1.14.0.zip']
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/7bbffa4/shogun/fix_python_linking.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/9df360c/shogun/fix_veclib.patch
	 https://github.com/shogun-toolbox/shogun/commit/365ce4c4c7.patch?full_index=1
EOF_patch :
install :
	 ENV.cxx11
	 ENV.append_to_cflags "-D__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES=0"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resource("numpy").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 if MacOS.version >= :high_sierra
	 ENV["LAPACKE_PATH"] = Formula["lapack"].opt_lib
	 end
	 libexec.install resource("jblas")
	 python_executable = Formula["python@2"].opt_bin/"python2"
	 python_prefix = Utils.popen_read("#{python_executable} -c 'import sys; print(sys.prefix)'").chomp
	 python_include = Utils.popen_read("#{python_executable} -c 'from distutils import sysconfig; print(sysconfig.get_python_inc(True))'").chomp
	 python_library = "#{python_prefix}/Python"
	 mkdir "build" do
	 system "cmake", "..", "-DBUILD_EXAMPLES=OFF",
	 "-DBUNDLE_JSON=OFF",
	 "-DBUNDLE_NLOPT=OFF",
	 "-DENABLE_TESTING=OFF",
	 "-DENABLE_COVERAGE=OFF",
	 "-DBUILD_META_EXAMPLES=OFF",
	 "-DINTERFACE_PYTHON=ON",
	 "-DINTERFACE_JAVA=ON",
	 "-DJBLAS=#{libexec}/jblas-#{resource("jblas").version}.jar",
	 "-DLIB_INSTALL_DIR=#{lib}",
	 "-DPYTHON_EXECUTABLE=#{python_executable}",
	 "-DPYTHON_INCLUDE_DIR=#{python_include}",
	 "-DPYTHON_LIBRARY=#{python_library}",
	 *std_cmake_args
	 system "make", "install"
	 end
