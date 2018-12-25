name :
	 Qwt
homepage :
	 https://qwt.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/qwt/qwt/6.1.3/qwt-6.1.3.tar.bz2
description :
	 Qt Widgets for Technical Applications
build_deps :
link_deps :
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/designer/designer.pro b/designer/designer.pro
	 index c269e9d..c2e07ae 100644
	 --- a/designer/designer.pro
	 +++ b/designer/designer.pro
	 @@ -126,6 +126,16 @@ contains(QWT_CONFIG, QwtDesigner) {
	 target.path = $${QWT_INSTALL_PLUGINS}
	 INSTALLS += target
	 +
	 +    macx {
	 +        contains(QWT_CONFIG, QwtFramework) {
	 +            QWT_LIB = qwt.framework/Versions/$${QWT_VER_MAJ}/qwt
	 +        }
	 +        else {
	 +            QWT_LIB = libqwt.$${QWT_VER_MAJ}.dylib
	 +        }
	 +        QMAKE_POST_LINK = install_name_tool -change $${QWT_LIB} $${QWT_INSTALL_LIBS}/$${QWT_LIB} $(DESTDIR)$(TARGET)
	 +    }
	 }
	 else {
	 TEMPLATE        = subdirs
install :
	 inreplace "qwtconfig.pri" do |s|
	 s.gsub! /^\s*QWT_INSTALL_PREFIX\s*=(.*)$/, "QWT_INSTALL_PREFIX=#{prefix}"
	 s.sub! %r{(= \$\$\{QWT_INSTALL_PREFIX\})/(plugins/designer)$},
	 "\\1/lib/qt/\\2"
	 end
	 args = ["-config", "release", "-spec"]
	 if ENV.compiler == :clang && MacOS.version >= :mavericks
	 args << "macx-clang"
	 else
	 args << "macx-g++"
	 end
	 system "qmake", *args
	 system "make"
	 system "make", "install"
