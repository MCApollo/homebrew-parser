name :
	 BpmTools
homepage :
	 http://www.pogo.org.uk/~mark/bpm-tools/
url :
	 http://www.pogo.org.uk/~mark/bpm-tools/releases/bpm-tools-0.3.tar.gz
description :
	 Detect tempo of audio files using beats-per-minute (BPM)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bpm"
