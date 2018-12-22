name :
	 Graphviz
homepage :
	 https://www.graphviz.org/
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/graphviz/graphviz-2.40.1.tar.gz
description :
	 Graph visualization software from AT&T and Bell Labs
build_deps :
	 pkg-config
link_deps :
	 :xcode
	 gd
	 libpng
	 libtool
	 gts
	 librsvg
	 pango
conflicts :
patches :
EOF_patch :
install :
	 inreplace "lib/sfio/features/sfio", "lib qfrexp\nlib qldexp\n", "" unless build.head?
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-php
	 --disable-swig
	 --with-quartz
	 --without-freetype2
	 --without-qt
	 --without-x
	 ]
	 args << "--with-gts" if build.with? "gts"
	 args << "--without-pangocairo" if build.without? "pango"
	 args << "--without-rsvg" if build.without? "librsvg"
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
	 if build.with? "app"
	 cd "macosx" do
	 xcodebuild "SDKROOT=#{MacOS.sdk_path}", "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}",
	 "ONLY_ACTIVE_ARCH=YES", "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}"
	 end
	 prefix.install "macosx/build/Release/Graphviz.app"
	 end
	 (bin/"gvmap.sh").unlink
