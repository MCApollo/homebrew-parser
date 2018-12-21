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
conflicts :
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
