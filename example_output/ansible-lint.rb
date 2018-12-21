name :
	 AnsibleLint
homepage :
	 https://github.com/willthames/ansible-lint/
url :
	 https://files.pythonhosted.org/packages/ac/37/5680eb8e4325120457bf177d7c3fe81a29eeeeb37f8fe0fc3131cd9ff721/ansible-lint-3.4.23.tar.gz
description :
	 Checks ansible playbooks for practices and behaviour
build_deps :
	 pkg-config
link_deps :
	 libyaml
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
