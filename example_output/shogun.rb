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
conflicts :
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
