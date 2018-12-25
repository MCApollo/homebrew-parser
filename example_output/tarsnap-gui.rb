name :
	 TarsnapGui
homepage :
	 https://github.com/Tarsnap/tarsnap-gui/wiki
url :
	 https://github.com/Tarsnap/tarsnap-gui/archive/v1.0.2.tar.gz
description :
	 Cross-platform GUI for the Tarsnap command-line client
build_deps :
link_deps :
	 qt
	 tarsnap
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "qmake"
	 system "make"
	 system "macdeployqt", "Tarsnap.app"
	 prefix.install "Tarsnap.app"
