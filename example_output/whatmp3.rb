name :
	 Whatmp3
homepage :
	 https://github.com/RecursiveForest/whatmp3
url :
	 https://github.com/RecursiveForest/whatmp3/archive/v3.8.tar.gz
description :
	 Small script to create mp3 torrents out of FLACs
build_deps :
link_deps :
	 flac
	 lame
	 mktorrent
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
