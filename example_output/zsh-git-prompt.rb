name :
	 ZshGitPrompt
homepage :
	 https://github.com/olivierverdier/zsh-git-prompt
url :
	 https://github.com/olivierverdier/zsh-git-prompt/archive/v0.5.tar.gz
description :
	 Informative git prompt for zsh
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
	 prefix.install Dir["*.{sh,py}"]
