name :
	 Wv2
homepage :
	 https://wvware.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/wvware/wv2-0.4.2.tar.bz2
description :
	 Programs for accessing Microsoft Word documents
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
	 libgsf
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv -lgobject-2.0"
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
