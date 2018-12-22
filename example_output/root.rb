name :
	 Root
homepage :
	 https://root.cern.ch/
url :
	 https://root.cern.ch/download/root_v6.14.06.source.tar.gz
description :
	 Object oriented framework for large scale data analysis
build_deps :
	 cmake
link_deps :
	 davix
	 fftw
	 gcc
	 graphviz
	 gsl
	 libxml2
	 lz4
	 openssl
	 pcre
	 tbb
	 xrootd
	 xz
	 python
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT") if DevelopmentTools.clang_build_version >= 900
	 inreplace "cmake/modules/SearchInstalledSoftware.cmake",
	 "http://lcgpackages",
	 "https://lcgpackages"
	 args = std_cmake_args + %W[
	 -Dgnuinstall=ON
	 -DCMAKE_INSTALL_ELISPDIR=#{elisp}
	 -DCLING_CXX_PATH=clang++
	 -Dbuiltin_freetype=ON
	 -Dbuiltin_cfitsio=OFF
	 -Ddavix=ON
	 -Dfitsio=OFF
	 -Dfftw3=ON
	 -Dfortran=ON
	 -Dgdml=ON
	 -Dmathmore=ON
	 -Dminuit2=ON
	 -Dmysql=OFF
	 -Dpgsql=OFF
	 -Droofit=ON
	 -Dssl=ON
	 -Dimt=ON
	 -Dxrootd=ON
	 -Dtmva=ON
	 ]
	 if build.with?("python") && build.with?("python@2")
	 odie "Root: Does not support building both python 2 and 3 wrappers"
	 elsif build.with?("python") || build.with?("python@2")
	 if build.with? "python@2"
	 ENV.prepend_path "PATH", Formula["python@2"].opt_libexec/"bin"
	 python_executable = Utils.popen_read("which python").strip
	 python_version = Language::Python.major_minor_version("python")
	 elsif build.with? "python"
	 python_executable = Utils.popen_read("which python3").strip
	 python_version = Language::Python.major_minor_version("python3")
	 end
	 python_prefix = Utils.popen_read("#{python_executable} -c 'import sys;print(sys.prefix)'").chomp
	 python_include = Utils.popen_read("#{python_executable} -c 'from distutils import sysconfig;print(sysconfig.get_python_inc(True))'").chomp
	 args << "-Dpython=ON"
	 if File.exist? "#{python_prefix}/Python"
	 python_library = "#{python_prefix}/Python"
	 elsif File.exist? "#{python_prefix}/lib/lib#{python_version}.a"
	 python_library = "#{python_prefix}/lib/lib#{python_version}.a"
	 elsif File.exist? "#{python_prefix}/lib/lib#{python_version}.dylib"
	 python_library = "#{python_prefix}/lib/lib#{python_version}.dylib"
	 else
	 odie "No libpythonX.Y.{a,dylib} file found!"
	 end
	 args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
	 args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
	 args << "-DPYTHON_LIBRARY='#{python_library}'"
	 else
	 args << "-Dpython=OFF"
	 end
	 mkdir "builddir" do
	 system "cmake", "..", *args
	 if MacOS.version < :high_sierra
	 system "xcrun", "make", "install"
	 else
	 system "make", "install"
	 end
	 chmod 0755, Dir[bin/"*.*sh"]
	 end
