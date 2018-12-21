name :
	 KeepkeyAgent
homepage :
	 https://github.com/romanz/trezor-agent
url :
	 https://files.pythonhosted.org/packages/65/72/4bf47a7bc8dc93d2ac21672a0db4bc58a78ec5cee3c4bcebd0b4092a9110/keepkey_agent-0.9.0.tar.gz
description :
	 Keepkey Hardware-based SSH/GPG agent
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
