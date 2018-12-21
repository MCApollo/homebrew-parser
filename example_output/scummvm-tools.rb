name :
	 ScummvmTools
homepage :
	 https://www.scummvm.org/
url :
	 https://www.scummvm.org/frs/scummvm-tools/2.0.0/scummvm-tools-2.0.0.tar.xz
description :
	 Collection of tools for ScummVM
build_deps :
link_deps :
	 boost
	 flac
	 freetype
	 libpng
	 libvorbis
	 mad
	 wxmac
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
