name :
	 Googler
homepage :
	 https://github.com/jarun/googler
url :
	 https://github.com/jarun/googler/archive/v3.7.1.tar.gz
description :
	 Google Search and News from the command-line
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "make", "disable-self-upgrade"
	 system "make", "install", "PREFIX=#{prefix}"
	 bash_completion.install "auto-completion/bash/googler-completion.bash"
	 fish_completion.install "auto-completion/fish/googler.fish"
	 zsh_completion.install "auto-completion/zsh/_googler"
