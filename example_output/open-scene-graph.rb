name :
	 OpenSceneGraph
homepage :
	 https://github.com/openscenegraph/OpenSceneGraph
url :
	 https://github.com/openscenegraph/OpenSceneGraph/archive/OpenSceneGraph-3.6.3.tar.gz
description :
	 3D graphics toolkit
build_deps :
	 cmake
	 doxygen
	 graphviz
	 pkg-config
link_deps :
	 freetype
	 gtkglext
	 jpeg
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/CMakeModules/FindGtkGl.cmake b/CMakeModules/FindGtkGl.cmake
	 index 321cede..6497589 100644
	 --- a/CMakeModules/FindGtkGl.cmake
	 +++ b/CMakeModules/FindGtkGl.cmake
	 @@ -10,7 +10,7 @@ IF(PKG_CONFIG_FOUND)
	 IF(WIN32)
	 PKG_CHECK_MODULES(GTKGL gtkglext-win32-1.0)
	 ELSE()
	 -        PKG_CHECK_MODULES(GTKGL gtkglext-x11-1.0)
	 +        PKG_CHECK_MODULES(GTKGL gtkglext-quartz-1.0)
	 ENDIF()
	 ENDIF()
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 args = std_cmake_args
	 args << "-DBUILD_DOCUMENTATION=ON"
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_FFmpeg=ON"
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_GDAL=ON"
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_TIFF=ON"
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_cairo=ON"
	 args << "-DCMAKE_CXX_FLAGS=-Wno-error=narrowing"
	 args << "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.arch_64_bit}"
	 args << "-DOSG_DEFAULT_IMAGE_PLUGIN_FOR_OSX=imageio"
	 args << "-DOSG_WINDOWING_SYSTEM=Cocoa"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "doc_openscenegraph"
	 system "make", "install"
	 doc.install Dir["#{prefix}/doc/OpenSceneGraphReferenceDocs/*"]
	 end
