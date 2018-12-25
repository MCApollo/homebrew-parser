name :
	 ZshNavigationTools
homepage :
	 https://github.com/psprint/zsh-navigation-tools
url :
	 https://github.com/psprint/zsh-navigation-tools/archive/v2.2.7.tar.gz
description :
	 Zsh curses-based tools, e.g. multi-word history searcher
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
