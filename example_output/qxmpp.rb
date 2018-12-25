name :
	 Qxmpp
homepage :
	 https://github.com/qxmpp-project/qxmpp/
url :
	 https://github.com/qxmpp-project/qxmpp/archive/v0.9.3.tar.gz
description :
	 Cross-platform C++ XMPP client and server library
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
	 system "qmake", "-config", "release", "PREFIX=#{prefix}"
	 system "make"
	 system "make", "install"
