name :
	 Sz81
homepage :
	 https://sz81.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sz81/sz81/2.1.7/sz81-2.1.7-source.tar.gz
description :
	 ZX80/81 emulator
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 PREFIX=#{prefix}
	 BINDIR=#{bin}
	 ]
	 system "make", *args
	 system "make", "install", *args
