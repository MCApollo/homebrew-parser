name :
	 Peru
homepage :
	 https://github.com/buildinspace/peru
url :
	 https://files.pythonhosted.org/packages/8e/db/ad9aa0e58bffc4f6f306d40608a7a755777ef283c28dee5a4c6a4dc47cad/peru-1.1.4.tar.gz
description :
	 Dependency retriever for version control and archives
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['docopt', 'PyYAML']
	 ['https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
