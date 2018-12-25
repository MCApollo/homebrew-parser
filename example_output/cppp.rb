name :
	 Cppp
homepage :
	 https://www.muppetlabs.com/~breadbox/software/cppp.html
url :
	 https://www.muppetlabs.com/~breadbox/pub/software/cppp-2.6.tar.gz
description :
	 Partial Preprocessor for C
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
	 bin.install "cppp"
