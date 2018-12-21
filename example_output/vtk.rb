name :
	 Vtk
homepage :
	 https://www.vtk.org/
url :
	 https://www.vtk.org/files/release/8.1/VTK-8.1.2.tar.gz
description :
	 Toolkit for 3D computer graphics, image processing, and visualization
build_deps :
	 cmake
link_deps :
	 boost
	 fontconfig
	 hdf5
	 jpeg
	 libpng
	 libtiff
	 netcdf
	 python@2
	 python
	 qt
	 pyqt
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DBUILD_SHARED_LIBS=ON
	 -DBUILD_TESTING=OFF
	 -DCMAKE_INSTALL_NAME_DIR:STRING=#{lib}
	 -DCMAKE_INSTALL_RPATH:STRING=#{lib}
	 -DModule_vtkInfovisBoost=ON
	 -DModule_vtkInfovisBoostGraphAlgorithms=ON
	 -DModule_vtkRenderingFreeTypeFontConfig=ON
	 -DVTK_REQUIRED_OBJCXX_FLAGS=''
	 -DVTK_USE_COCOA=ON
	 -DVTK_USE_SYSTEM_EXPAT=ON
	 -DVTK_USE_SYSTEM_HDF5=ON
	 -DVTK_USE_SYSTEM_JPEG=ON
	 -DVTK_USE_SYSTEM_LIBXML2=ON
	 -DVTK_USE_SYSTEM_NETCDF=ON
	 -DVTK_USE_SYSTEM_PNG=ON
	 -DVTK_USE_SYSTEM_TIFF=ON
	 -DVTK_USE_SYSTEM_ZLIB=ON
	 ]
	 mkdir "build" do
	 if build.with?("python") && build.with?("python@2")
	 odie "VTK: Does not support building both python 2 and 3 wrappers"
	 elsif build.with?("python") || build.with?("python@2")
	 python_executable = `which python3`.strip if build.with? "python"
	 python_executable = `which python2.7`.strip if build.with? "python@2"
	 python_prefix = `#{python_executable} -c 'import sys;print(sys.prefix)'`.chomp
	 python_include = `#{python_executable} -c 'from distutils import sysconfig;print(sysconfig.get_python_inc(True))'`.chomp
	 python_version = "python" + `#{python_executable} -c 'import sys;print(sys.version[:3])'`.chomp
	 py_site_packages = "#{lib}/#{python_version}/site-packages"
	 args << "-DVTK_WRAP_PYTHON=ON"
	 args << "-DPYTHON_EXECUTABLE='#{python_executable}'"
	 args << "-DPYTHON_INCLUDE_DIR='#{python_include}'"
	 if File.exist? "#{python_prefix}/Python"
	 args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"
	 elsif File.exist? "#{python_prefix}/lib/lib#{python_version}.a"
	 args << "-DPYTHON_LIBRARY='#{python_prefix}/lib/lib#{python_version}.a'"
	 elsif File.exist? "#{python_prefix}/lib/lib#{python_version}.dylib"
	 args << "-DPYTHON_LIBRARY='#{python_prefix}/lib/lib#{python_version}.dylib'"
	 else
	 odie "No libpythonX.Y.{dylib|a} file found!"
