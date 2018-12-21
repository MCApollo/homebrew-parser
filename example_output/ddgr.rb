name :
	 Ddgr
homepage :
	 https://github.com/jarun/ddgr
url :
	 https://github.com/jarun/ddgr/archive/v1.6.tar.gz
description :
	 DuckDuckGo from the terminal
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
	 bash_completion.install "auto-completion/bash/ddgr-completion.bash"
	 fish_completion.install "auto-completion/fish/ddgr.fish"
	 zsh_completion.install "auto-completion/zsh/_ddgr"
