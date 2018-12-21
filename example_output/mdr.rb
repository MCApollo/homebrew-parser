name :
	 Mdr
homepage :
	 https://github.com/halffullheart/mdr
url :
	 https://github.com/halffullheart/mdr/archive/v1.0.1.tar.gz
description :
	 Make diffs readable
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "rake"
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"build/dev/mdr"
