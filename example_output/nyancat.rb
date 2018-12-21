name :
	 Nyancat
homepage :
	 https://github.com/klange/nyancat
url :
	 https://github.com/klange/nyancat/archive/1.5.2.tar.gz
description :
	 Renders an animated, color, ANSI-text loop of the Poptart Cat
build_deps :
link_deps :
conflicts :
patches :
	 https://github.com/klange/nyancat/pull/34.patch?full_index=1
EOF_patch :
install :
	 system "make"
	 system "make", "install", "instdir=#{prefix}"
