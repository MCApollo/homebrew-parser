name :
	 Kqwait
homepage :
	 https://github.com/sschober/kqwait
url :
	 https://github.com/sschober/kqwait/archive/kqwait-v1.0.3.tar.gz
description :
	 Wait for events on files or directories on macOS
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "kqwait"
