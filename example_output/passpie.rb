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
optional_deps :
conflicts :
resource :
	 ['click', 'PyYAML', 'rstr', 'tabulate', 'tinydb']
	 ['https://files.pythonhosted.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz', 'https://files.pythonhosted.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz', 'https://files.pythonhosted.org/packages/34/73/bf268029482255aa125f015baab1522a22ad201ea5e324038fb542bc3706/rstr-2.2.4.tar.gz', 'https://files.pythonhosted.org/packages/db/40/6ffc855c365769c454591ac30a25e9ea0b3e8c952a1259141f5b9878bd3d/tabulate-0.7.5.tar.gz', 'https://files.pythonhosted.org/packages/6c/2e/0df79439cf5cb3c6acfc9fb87e12d9a0ff45d3c573558079b09c72b64ced/tinydb-3.2.1.zip']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
