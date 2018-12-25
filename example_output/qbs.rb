name :
	 Qbs
homepage :
	 https://wiki.qt.io/Qbs
url :
	 https://download.qt.io/official_releases/qbs/1.12.2/qbs-src-1.12.2.tar.gz
description :
	 Build tool for developing projects across multiple platforms
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
install :
	 system "qmake", "qbs.pro", "-r", "QBS_INSTALL_PREFIX=#{prefix}", "CONFIG+=qbs_disable_rpath"
	 system "make", "install", "INSTALL_ROOT=/"
