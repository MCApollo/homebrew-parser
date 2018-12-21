name :
	 Mdp
homepage :
	 https://github.com/visit1985/mdp
url :
	 https://github.com/visit1985/mdp/archive/1.0.15.tar.gz
description :
	 Command-line based markdown presentation tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
	 pkgshare.install "sample.md"
