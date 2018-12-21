name :
	 Cheat
homepage :
	 https://github.com/chrisallenlane/cheat
url :
	 https://github.com/chrisallenlane/cheat/archive/2.3.1.tar.gz
description :
	 Create and view interactive cheat sheets for *nix commands
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bash_completion.install "cheat/autocompletion/cheat.bash"
	 zsh_completion.install "cheat/autocompletion/cheat.zsh" => "_cheat"
