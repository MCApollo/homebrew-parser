name :
	 Abcmidi
homepage :
	 https://www.ifdo.ca/~seymour/runabc/top.html
url :
	 https://www.ifdo.ca/~seymour/runabc/abcMIDI-2018.06.23.zip
description :
	 Converts abc music notation files to MIDI files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm "makefile"
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
