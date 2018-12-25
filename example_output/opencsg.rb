name :
	 Opencsg
homepage :
	 http://www.opencsg.org
url :
	 http://www.opencsg.org/OpenCSG-1.4.2.tar.gz
description :
	 The CSG rendering library
build_deps :
	 qt
link_deps :
	 glew
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/990b9bb/opencsg/disable-examples.diff
EOF_patch :
install :
	 system "qmake", "-r", "INSTALLDIR=#{prefix}",
	 "INCLUDEPATH+=#{Formula["glew"].opt_include}",
	 "LIBS+=-L#{Formula["glew"].opt_lib} -lGLEW"
	 system "make", "install"
