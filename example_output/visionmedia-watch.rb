name :
	 VisionmediaWatch
homepage :
	 https://github.com/visionmedia/watch
url :
	 https://github.com/visionmedia/watch/archive/0.3.1.tar.gz
description :
	 Periodically executes the given command
build_deps :
link_deps :
conflicts :
	 watch
patches :
EOF_patch :
install :
	 bin.mkdir
	 system "make", "PREFIX=#{prefix}", "install"
