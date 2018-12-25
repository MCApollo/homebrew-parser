name :
	 Qscintilla2
homepage :
	 https://www.riverbankcomputing.com/software/qscintilla/intro
url :
	 https://downloads.sourceforge.net/project/pyqt/QScintilla2/QScintilla-2.10.4/QScintilla_gpl-2.10.4.tar.gz
description :
	 Port to Qt of the Scintilla editing component
build_deps :
link_deps :
	 pyqt
	 python
	 python@2
	 qt
	 sip
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 spec = (ENV.compiler == :clang && MacOS.version >= :mavericks) ? "macx-clang" : "macx-g++"
	 args = %W[-config release -spec #{spec}]
	 cd "Qt4Qt5" do
	 inreplace "qscintilla.pro" do |s|
	 s.gsub! "$$[QT_INSTALL_LIBS]", lib
	 s.gsub! "$$[QT_INSTALL_HEADERS]", include
	 s.gsub! "$$[QT_INSTALL_TRANSLATIONS]", prefix/"trans"
	 s.gsub! "$$[QT_INSTALL_DATA]", prefix/"data"
	 s.gsub! "$$[QT_HOST_DATA]", prefix/"data"
	 end
	 inreplace "features/qscintilla2.prf" do |s|
	 s.gsub! "$$[QT_INSTALL_LIBS]", lib
	 s.gsub! "$$[QT_INSTALL_HEADERS]", include
	 end
	 system "qmake", "qscintilla.pro", *args
	 system "make"
	 system "make", "install"
	 end
	 ENV["QMAKEFEATURES"] = prefix/"data/mkspecs/features"
	 cd "Python" do
	 Language::Python.each_python(build) do |python, version|
	 (share/"sip").mkpath
	 system python, "configure.py", "-o", lib, "-n", include,
	 "--apidir=#{prefix}/qsci",
	 "--destdir=#{lib}/python#{version}/site-packages/PyQt5",
	 "--stubsdir=#{lib}/python#{version}/site-packages/PyQt5",
	 "--qsci-sipdir=#{share}/sip",
	 "--qsci-incdir=#{include}",
	 "--qsci-libdir=#{lib}",
	 "--pyqt=PyQt5",
	 "--pyqt-sipdir=#{Formula["pyqt"].opt_share}/sip/Qt5",
	 "--sip-incdir=#{Formula["sip"].opt_include}",
	 "--spec=#{spec}"
	 system "make"
	 system "make", "install"
	 system "make", "clean"
	 end
	 end
