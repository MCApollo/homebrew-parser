name :
	 Legit
homepage :
	 https://www.git-legit.org/
url :
	 https://files.pythonhosted.org/packages/44/72/a086485566cf7b5ff7b6858b7dc144c76323e021d88f455ceacd5a6c02fd/legit-1.0.1.tar.gz
description :
	 Command-line interface for Git, optimized for workflow simplicity
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bash_completion.install "extra/bash-completion/legit"
	 zsh_completion.install "extra/zsh-completion/_legit"
	 man1.install "extra/man/legit.1"
