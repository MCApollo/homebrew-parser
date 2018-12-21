name :
	 Residualvm
homepage :
	 http://residualvm.org
url :
	 https://downloads.sourceforge.net/project/residualvm/residualvm/0.2.1/residualvm-0.2.1-sources.tar.bz2
description :
	 3D graphic adventure game interpreter
build_deps :
link_deps :
	 faad2
	 flac
	 fluid-synth
	 freetype
	 jpeg
	 libpng
	 libvorbis
	 mad
	 sdl
	 theora
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--enable-release"
	 system "make"
	 system "make", "install"
	 (share+"icons").rmtree
	 (share+"pixmaps").rmtree
