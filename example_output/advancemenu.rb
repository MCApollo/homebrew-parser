name :
	 Advancemenu
homepage :
	 https://www.advancemame.it/menu-readme.html
url :
	 https://github.com/amadvance/advancemame/releases/download/advancemenu-2.9/advancemenu-2.9.tar.gz
description :
	 Frontend for AdvanceMAME/MESS
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
	 advancemame
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install", "LDFLAGS=#{ENV.ldflags}", "mandir=#{man}"
