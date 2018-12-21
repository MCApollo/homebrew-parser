name :
	 Mycli
homepage :
	 https://mycli.net/
url :
	 https://files.pythonhosted.org/packages/f3/2b/4ffda993845718276c5c61350204fa55c7d9832d2b92551a48cbf6a20a56/mycli-1.19.0.tar.gz
description :
	 CLI for MySQL with auto-completion and syntax highlighting
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
