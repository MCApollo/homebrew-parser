name :
	 RustcCompletion
homepage :
	 https://github.com/roshan/rust-bash-completion
url :
description :
	 Bash completion for rustc
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
	 bash_completion.install "etc/bash_completion.d/rustc"
