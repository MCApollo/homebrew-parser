name :
	 Crunch
homepage :
	 https://sourceforge.net/projects/crunch-wordlist/
url :
	 https://downloads.sourceforge.net/project/crunch-wordlist/crunch-wordlist/crunch-3.6.tgz
description :
	 Wordlist generator
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
	 system "make", "CC=#{ENV.cc}", "LFS=-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
	 bin.install "crunch"
	 man1.install "crunch.1"
	 share.install Dir["*.lst"]
