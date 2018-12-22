name :
	 Gibo
homepage :
	 https://github.com/simonwhitaker/gibo
url :
	 https://github.com/simonwhitaker/gibo/archive/2.1.0.tar.gz
description :
	 Access GitHub's .gitignore boilerplates
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "gibo"
	 bash_completion.install "shell-completions/gibo-completion.bash"
	 zsh_completion.install "shell-completions/gibo-completion.zsh" => "_gibo"
	 fish_completion.install "shell-completions/gibo.fish"
