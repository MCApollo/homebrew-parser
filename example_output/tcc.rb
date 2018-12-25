name :
	 Tcc
homepage :
	 https://bellard.org/tcc/
url :
	 https://download.savannah.nongnu.org/releases/tinycc/tcc-0.9.27.tar.bz2
description :
	 Tiny C compiler
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --source-path=#{buildpath}
	 --sysincludepaths=/usr/local/include:#{MacOS.sdk_path}/usr/include:{B}/include
	 ]
	 args << "--enable-cross" if build.with? "cross"
	 ENV.deparallelize
	 system "./configure", *args
	 system "make", "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 system "make", "install"
