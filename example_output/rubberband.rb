name :
	 Rubberband
homepage :
	 https://breakfastquay.com/rubberband/
url :
	 https://breakfastquay.com/files/releases/rubberband-1.8.2.tar.bz2
description :
	 Audio time stretcher tool and library
build_deps :
	 pkg-config
link_deps :
	 libsamplerate
	 libsndfile
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-f", "Makefile.osx"
	 bin.install "bin/rubberband"
	 lib.install "lib/librubberband.dylib" => "librubberband.2.1.1.dylib"
	 lib.install_symlink lib/"librubberband.2.1.1.dylib" => "librubberband.2.dylib"
	 lib.install_symlink lib/"librubberband.2.1.1.dylib" => "librubberband.dylib"
	 include.install "rubberband"
	 cp "rubberband.pc.in", "rubberband.pc"
	 inreplace "rubberband.pc", "%PREFIX%", opt_prefix
	 (lib/"pkgconfig").install "rubberband.pc"
