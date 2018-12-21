name :
	 Watson
homepage :
	 https://tailordev.github.io/Watson/
url :
	 https://files.pythonhosted.org/packages/a6/c4/bb84f25803a8f03388e4ce68fc635beb6be8735a27397c00cf14ff26d948/td-watson-1.6.0.tar.gz
description :
	 Command-line tool to track (your) time
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bash_completion.install "watson.completion" => "watson"
	 zsh_completion.install "watson.zsh-completion" => "_watson"
