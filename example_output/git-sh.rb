name :
	 GitSh
homepage :
	 https://github.com/rtomayko/git-sh
url :
	 https://github.com/rtomayko/git-sh/archive/1.3.tar.gz
description :
	 Customized Bash environment for git work
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
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
