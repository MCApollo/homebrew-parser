name :
	 Mp3val
homepage :
	 https://mp3val.sourceforge.io/
url :
	 https://downloads.sourceforge.net/mp3val/mp3val-0.1.8-src.tar.gz
description :
	 Program for MPEG audio stream validation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "gnumake", "-f", "Makefile.gcc"
	 bin.install "mp3val.exe" => "mp3val"
