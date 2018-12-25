name :
	 B2sum
homepage :
	 https://github.com/BLAKE2/BLAKE2
url :
	 https://github.com/BLAKE2/BLAKE2/archive/20160619.tar.gz
description :
	 BLAKE2 b2sum reference binary
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
	 cd "b2sum" do
	 system "make", "NO_OPENMP=1"
	 system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
	 end
