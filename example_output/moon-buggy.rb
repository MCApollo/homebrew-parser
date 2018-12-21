name :
	 MoonBuggy
homepage :
	 https://www.seehuhn.de/pages/moon-buggy.html
url :
	 https://m.seehuhn.de/programs/moon-buggy-1.0.tar.gz
description :
	 Drive some car across the moon
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}"
	 system "make", "install"
