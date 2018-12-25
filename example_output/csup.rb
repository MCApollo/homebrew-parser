name :
	 Csup
homepage :
	 https://bitbucket.org/mux/csup
url :
	 https://bitbucket.org/mux/csup/get/REL_20120305.tar.gz
description :
	 Rewrite of CVSup in C
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "csup"
	 man1.install "csup.1"
