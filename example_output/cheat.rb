name :
	 Cheat
homepage :
	 https://github.com/chrisallenlane/cheat
url :
	 https://github.com/chrisallenlane/cheat/archive/2.3.1.tar.gz
description :
	 Create and view interactive cheat sheets for *nix commands
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['docopt', 'Pygments']
	 ['https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bash_completion.install "cheat/autocompletion/cheat.bash"
	 zsh_completion.install "cheat/autocompletion/cheat.zsh" => "_cheat"
