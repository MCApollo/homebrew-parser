name :
	 PipesSh
homepage :
	 https://github.com/pipeseroni/pipes.sh
url :
	 https://github.com/pipeseroni/pipes.sh/archive/v1.3.0.tar.gz
description :
	 Animated pipes terminal screensaver
build_deps :
link_deps :
	 bash
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
