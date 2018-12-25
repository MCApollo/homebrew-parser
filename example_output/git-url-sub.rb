name :
	 GitUrlSub
homepage :
	 https://gosuri.github.io/git-url-sub
url :
	 https://github.com/gosuri/git-url-sub/archive/1.0.1.tar.gz
description :
	 Recursively substitute remote URLs for multiple repos
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
	 system "make", "install", "PREFIX=#{prefix}"
