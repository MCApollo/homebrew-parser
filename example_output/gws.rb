name :
	 Gws
homepage :
	 https://streakycobra.github.io/gws/
url :
	 https://github.com/StreakyCobra/gws/archive/0.2.0.tar.gz
description :
	 Manage workspaces composed of git repositories
build_deps :
link_deps :
	 bash
conflicts :
patches :
EOF_patch :
install :
	 bin.install "src/gws"
	 bash_completion.install "completions/bash"
	 zsh_completion.install "completions/zsh"
