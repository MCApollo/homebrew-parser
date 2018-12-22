name :
	 Yadm
homepage :
	 https://thelocehiliosan.github.io/yadm/
url :
	 https://github.com/TheLocehiliosan/yadm/archive/1.12.0.tar.gz
description :
	 Yet Another Dotfiles Manager
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "yadm"
	 man1.install "yadm.1"
	 bash_completion.install "completion/yadm.bash_completion"
	 zsh_completion.install  "completion/yadm.zsh_completion" => "_yadm"
