name :
	 Gdcm
homepage :
	 https://sourceforge.net/projects/gdcm/
url :
	 https://downloads.sourceforge.net/project/gdcm/gdcm%202.x/GDCM%202.8.7/gdcm-2.8.7.tar.gz
description :
	 Grassroots DICOM library and utilities for medical files
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openjpeg
	 openssl
	 python@2
	 python
	 swig
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 common_args = std_cmake_args + %w[
	 -DGDCM_BUILD_APPLICATIONS=ON
	 -DGDCM_BUILD_SHARED_LIBS=ON
	 -DGDCM_BUILD_TESTING=OFF
	 -DGDCM_BUILD_EXAMPLES=OFF
	 -DGDCM_BUILD_DOCBOOK_MANPAGES=OFF
	 -DGDCM_USE_VTK=OFF
	 -DGDCM_USE_SYSTEM_OPENJPEG=ON
	 -DGDCM_USE_SYSTEM_OPENSSL=ON
	 ]
	 mkdir "build" do
	 if build.without?("python") && build.without?("python@2")
	 system "cmake", "..", *common_args
	 system "make", "install"
	 else
	 ENV.append "LDFLAGS", "-undefined dynamic_lookup"
	 Language::Python.each_python(build) do |python, py_version|
	 python_include = Utils.popen_read("#{python} -c 'from distutils import sysconfig;print(sysconfig.get_python_inc(True))'").chomp
	 args = common_args + %W[
	 -DGDCM_WRAP_PYTHON=ON
	 -DPYTHON_EXECUTABLE=#{python}
	 -DPYTHON_INCLUDE_DIR=#{python_include}
	 -DGDCM_INSTALL_PYTHONMODULE_DIR=#{lib}/python#{py_version}/site-packages
	 -DCMAKE_INSTALL_RPATH=#{lib}
	 -DGDCM_NO_PYTHON_LIBS_LINKING=ON
	 ]
	 system "cmake", "..", *args
	 system "make", "install"
	 end
	 end
