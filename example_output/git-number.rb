name :
	 GitNumber
homepage :
	 https://github.com/holygeek/git-number
url :
	 https://github.com/holygeek/git-number/archive/1.0.1.tar.gz
description :
	 Use numbers for dealing with files in git
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "test"
	 system "make", "prefix=#{prefix}", "install"
