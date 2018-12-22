name :
	 YarnCompletion
homepage :
	 https://github.com/dsifford/yarn-completion
url :
	 https://github.com/dsifford/yarn-completion/archive/v0.8.0.tar.gz
description :
	 Bash completion for Yarn
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bash_completion.install "yarn-completion.bash" => "yarn"
