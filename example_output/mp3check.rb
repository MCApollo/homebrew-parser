name :
	 Mp3check
homepage :
	 https://code.google.com/archive/p/mp3check/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mp3check/mp3check-0.8.7.tgz
description :
	 Tool to check mp3 files for consistency
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make"
	 bin.install "mp3check"
