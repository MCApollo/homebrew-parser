name :
	 Joe
homepage :
	 https://joe-editor.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-4.6/joe-4.6.tar.gz
description :
	 Joe's Own Editor (JOE)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
