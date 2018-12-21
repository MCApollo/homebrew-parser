name :
	 Flow
homepage :
	 https://flowtype.org/
url :
	 https://github.com/facebook/flow/archive/v0.81.0.tar.gz
description :
	 Static type checker for JavaScript
build_deps :
	 ocaml
	 opam
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all-homebrew"
	 bin.install "bin/flow"
	 bash_completion.install "resources/shell/bash-completion" => "flow-completion.bash"
	 zsh_completion.install_symlink bash_completion/"flow-completion.bash" => "_flow"
