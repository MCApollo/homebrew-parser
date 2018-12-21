name :
	 Soundpipe
homepage :
	 https://paulbatchelor.github.io/proj/soundpipe.html
url :
	 https://github.com/PaulBatchelor/soundpipe/archive/v1.7.0.tar.gz
description :
	 Lightweight music DSP library
build_deps :
link_deps :
	 libsndfile
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
	 pkgshare.install "examples", "test"
