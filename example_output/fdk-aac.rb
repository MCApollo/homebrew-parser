name :
	 FdkAac
homepage :
	 https://sourceforge.net/projects/opencore-amr/
url :
	 https://downloads.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.0.tar.gz
description :
	 Standalone library of the Fraunhofer FDK AAC code from Android
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-example"
	 system "make", "install"
