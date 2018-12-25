name :
	 Cifer
homepage :
	 https://code.google.com/p/cifer/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cifer/cifer-1.2.0.tar.gz
description :
	 Work on automating classical cipher cracking in C
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}",
	 "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}",
	 "install"
