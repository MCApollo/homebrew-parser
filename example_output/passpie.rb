name :
	 Passpie
homepage :
	 https://github.com/marcwebbie/passpie
url :
	 https://files.pythonhosted.org/packages/c8/2e/db84fa9d33c9361024343411875835143dc7b73eb3320b41c4f543b40ad6/passpie-1.6.1.tar.gz
description :
	 Manage login credentials from the terminal
build_deps :
link_deps :
	 gnupg
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
