name :
	 Vcsh
homepage :
	 https://github.com/RichiH/vcsh
url :
	 https://github.com/RichiH/vcsh/archive/v1.20151229-1.tar.gz
description :
	 Config manager based on git
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
	 bin.install "vcsh"
	 man1.install "vcsh.1"
	 zsh_completion.install "_vcsh"
