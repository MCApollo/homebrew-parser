name :
	 Scummvm
homepage :
	 https://www.scummvm.org/
url :
	 https://www.scummvm.org/frs/scummvm/2.0.0/scummvm-2.0.0.tar.xz
description :
	 Graphic adventure game interpreter
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
	 sdl2
	 theora
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--enable-release"
	 system "make"
	 system "make", "install"
	 (share+"pixmaps").rmtree
	 (share+"icons").rmtree
