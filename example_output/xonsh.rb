name :
	 Xonsh
homepage :
	 https://xon.sh/
url :
	 https://github.com/xonsh/xonsh/archive/0.8.3.tar.gz
description :
	 Python-ish, BASHwards-compatible shell language and command prompt
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['prompt_toolkit', 'Pygments', 'setproctitle', 'six', 'wcwidth']
	 ['https://files.pythonhosted.org/packages/d9/a5/4b2dd1a05403e34c3ba0d9c00f237c01967c0a4f59a427c9b241129cdfe4/prompt_toolkit-2.0.7.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3/setproctitle-1.1.10.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
