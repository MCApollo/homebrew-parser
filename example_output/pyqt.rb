name :
	 Pyqt
homepage :
	 https://www.riverbankcomputing.com/software/pyqt/download5
url :
	 https://dl.bintray.com/homebrew/mirror/pyqt-5.10.1.tar.gz
description :
	 Python bindings for v5 of Qt
build_deps :
link_deps :
	 qt
	 sip
	 python
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/4f563668/pyqt/qt-5.11.diff
EOF_patch :
install :
	 Language::Python.each_python(build) do |python, version|
	 args = ["--confirm-license",
	 "--bindir=#{bin}",
	 "--destdir=#{lib}/python#{version}/site-packages",
	 "--stubsdir=#{lib}/python#{version}/site-packages/PyQt5",
	 "--sipdir=#{share}/sip/Qt5",
	 "--sip-incdir=#{Formula["sip"].opt_include}",
	 "--qmake=#{Formula["qt"].bin}/qmake",
	 "QMAKE_MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
	 "--qml-plugindir=#{pkgshare}/plugins",
	 "--verbose"]
	 system python, "configure.py", *args
	 system "make"
	 system "make", "install"
	 system "make", "clean"
	 end
