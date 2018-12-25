name :
	 Ent
homepage :
	 https://www.fourmilab.ch/random/
url :
	 https://github.com/psm14/ent/archive/1.0.tar.gz
description :
	 Pseudorandom number sequence test program
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
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 bin.install "ent"
	 prefix.install "entest.mas", "entitle.gif"
