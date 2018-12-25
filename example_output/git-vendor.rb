name :
	 GitVendor
homepage :
	 https://brettlangdon.github.io/git-vendor
url :
	 https://github.com/brettlangdon/git-vendor/archive/v1.1.2.tar.gz
description :
	 Command for managing git vendored dependencies
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
	 system "make", "PREFIX=#{prefix}", "install"
