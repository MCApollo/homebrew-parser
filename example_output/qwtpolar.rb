name :
	 Qwtpolar
homepage :
	 https://qwtpolar.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/qwtpolar/qwtpolar/1.1.1/qwtpolar-1.1.1.tar.bz2
description :
	 Library for displaying values on a polar coordinate system
build_deps :
link_deps :
	 qt
	 qwt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/designer/designer.pro b/designer/designer.pro
	 index 24770fd..3ff0761 100644
	 --- a/designer/designer.pro
	 +++ b/designer/designer.pro
	 @@ -75,6 +75,16 @@ contains(QWT_POLAR_CONFIG, QwtPolarDesigner) {
	 target.path = $${QWT_POLAR_INSTALL_PLUGINS}
	 INSTALLS += target
	 +
	 +    macx {
	 +        contains(QWT_POLAR_CONFIG, QwtPolarFramework) {
	 +            QWTP_LIB = qwtpolar.framework/Versions/$${QWT_POLAR_VER_MAJ}/qwtpolar
	 +        }
	 +        else {
	 +            QWTP_LIB = libqwtpolar.$${QWT_POLAR_VER_MAJ}.dylib
	 +        }
	 +        QMAKE_POST_LINK = install_name_tool -change $${QWTP_LIB} $${QWT_POLAR_INSTALL_LIBS}/$${QWTP_LIB} $(DESTDIR)$(TARGET)
	 +    }
	 }
	 else {
	 TEMPLATE        = subdirs
install :
	 cd "doc" do
	 doc.install "html"
	 man3.install Dir["man/man3/{q,Q}wt*"]
	 end
	 rm_r "doc"
	 inreplace "qwtpolarconfig.pri" do |s|
	 s.gsub!(/^(\s*)QWT_POLAR_INSTALL_PREFIX\s*=\s*(.*)$/,
	 "\\1QWT_POLAR_INSTALL_PREFIX=#{prefix}")
	 s.sub!(/\+(=\s*QwtPolarExamples)/, "-\\1")
	 s.sub! %r{(= \$\$\{QWT_POLAR_INSTALL_PREFIX\})/(plugins/designer)$},
	 "\\1/lib/qt/\\2"
	 end
	 ENV["QMAKEFEATURES"] = "#{Formula["qwt"].opt_prefix}/features"
	 system "qmake", "-config", "release"
	 system "make"
	 system "make", "install"
	 pkgshare.install "examples"
	 pkgshare.install Dir["*.p*"]
