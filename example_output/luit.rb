name :
	 Luit
homepage :
	 https://invisible-island.net/luit/
url :
	 https://invisible-mirror.net/archives/luit/luit-20180628.tgz
description :
	 Filter run between arbitrary application and UTF-8 terminal emulator
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
	 system "./configure", "--prefix=#{prefix}", "--without-x"
	 system "make", "install"
