name :
	 Id3v2
homepage :
	 https://id3v2.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/id3v2/id3v2/0.1.12/id3v2-0.1.12.tar.gz
description :
	 Command-line editor
build_deps :
link_deps :
	 id3lib
conflicts :
patches :
EOF_patch :
install :
	 system "make", "clean"
	 bin.mkpath
	 man1.mkpath
	 system "make", "install", "PREFIX=#{prefix}"
