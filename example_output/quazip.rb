name :
	 Quazip
homepage :
	 https://quazip.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/quazip/quazip/0.7.3/quazip-0.7.3.tar.gz
description :
	 C++ wrapper over Gilles Vollant's ZIP/UNZIP package
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
	 system "qmake", "quazip.pro", "-config", "release",
	 "PREFIX=#{prefix}", "LIBS+=-lz"
	 system "make", "install"
