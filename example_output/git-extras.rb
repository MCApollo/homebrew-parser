name :
	 GitExtras
homepage :
	 https://github.com/tj/git-extras
url :
	 https://github.com/tj/git-extras/archive/4.6.0.tar.gz
description :
	 Small git utilities
build_deps :
link_deps :
optional_deps :
conflicts :
	 git-utils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "INSTALL_VIA=brew", "install"
	 pkgshare.install "etc/git-extras-completion.zsh"
