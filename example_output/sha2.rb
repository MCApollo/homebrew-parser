name :
	 Sha2
homepage :
	 https://www.aarongifford.com/computers/sha.html
url :
	 https://www.aarongifford.com/computers/sha2-1.0.1.tgz
description :
	 Implementation of SHA-256, SHA-384, and SHA-512 hash algorithms
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
	 system ENV.cc, "-o", "sha2", "sha2prog.c", "sha2.c"
	 system "perl", "sha2test.pl"
	 bin.install "sha2"
