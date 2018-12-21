name :
	 Spigot
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/spigot/
url :
	 https://www.chiark.greenend.org.uk/~sgtatham/spigot/spigot-20180515.c2b5409.tar.gz
description :
	 Command-line streaming exact real calculator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
