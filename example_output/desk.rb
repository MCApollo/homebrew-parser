name :
	 Desk
homepage :
	 https://github.com/jamesob/desk
url :
	 https://github.com/jamesob/desk/archive/v0.6.0.tar.gz
description :
	 Lightweight workspace manager for the shell
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
	 bin.install "desk"
	 bash_completion.install "shell_plugins/bash/desk"
	 zsh_completion.install "shell_plugins/zsh/_desk"
	 fish_completion.install "shell_plugins/fish/desk.fish"
