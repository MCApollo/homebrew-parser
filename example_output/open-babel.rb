name :
	 OpenBabel
homepage :
	 https://openbabel.org
url :
	 https://github.com/openbabel/openbabel/archive/openbabel-2-4-1.tar.gz
description :
	 Chemical toolbox
build_deps :
	 cmake
	 pkg-config
link_deps :
	 eigen
	 cairo
	 python@2
	 swig
	 wxmac
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DRUN_SWIG=ON" if build.with?("python@2") || build.with?("java")
	 args << "-DJAVA_BINDINGS=ON" if build.with? "java"
	 args << "-DBUILD_GUI=ON" if build.with? "wxmac"
	 if build.with? "python@2"
	 ENV.prepend_path "PATH", Formula["python@2"].opt_libexec/"bin"
	 pypref = `python -c 'import sys;print(sys.prefix)'`.strip
	 pyinc = `python -c 'from distutils import sysconfig;print(sysconfig.get_python_inc(True))'`.strip
	 args << "-DPYTHON_BINDINGS=ON"
	 args << "-DPYTHON_INCLUDE_DIR='#{pyinc}'"
	 args << "-DPYTHON_LIBRARY='#{pypref}/lib/libpython2.7.dylib'"
