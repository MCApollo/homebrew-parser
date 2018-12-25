name :
	 Freeglut
homepage :
	 https://freeglut.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/freeglut/freeglut/3.0.0/freeglut-3.0.0.tar.gz
description :
	 Open-source alternative to the OpenGL Utility Toolkit (GLUT) library
build_deps :
	 cmake
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/CMakeLists.txt b/CMakeLists.txt
	 index 28f8651..d1f6a86 100644
	 --- a/CMakeLists.txt
	 +++ b/CMakeLists.txt
	 @@ -220,6 +220,16 @@
	 IF(FREEGLUT_GLES)
	 ADD_DEFINITIONS(-DFREEGLUT_GLES)
	 LIST(APPEND LIBS GLESv2 GLESv1_CM EGL)
	 +ELSEIF(APPLE)
	 +
	 +  FIND_PATH(GLX_INCLUDE_DIR GL/glx.h
	 +            PATHS /opt/X11/include /usr/X11/include /usr/X11R6/include)
	 +  FIND_LIBRARY(OPENGL_gl_LIBRARY GL
	 +               PATHS /opt/X11/lib /usr/X11/lib /usr/X11R6/lib)
	 +  FIND_LIBRARY(OPENGL_glu_LIBRARY GLU
	 +               PATHS /opt/X11/lib /usr/X11/lib /usr/X11R6/lib)
	 +  LIST(APPEND LIBS ${OPENGL_gl_LIBRARY})
	 +  INCLUDE_DIRECTORIES(${GLX_INCLUDE_DIR})
	 ELSE()
	 FIND_PACKAGE(OpenGL REQUIRED)
	 LIST(APPEND LIBS ${OPENGL_gl_LIBRARY})
install :
	 inreplace "src/x11/fg_main_x11.c", "CLOCK_MONOTONIC", "UNDEFINED_GIBBERISH"
	 system "cmake", "-D", "FREEGLUT_BUILD_DEMOS:BOOL=OFF", "-D", "CMAKE_INSTALL_PREFIX:PATH=#{prefix}", "."
	 system "make", "all"
	 system "make", "install"
