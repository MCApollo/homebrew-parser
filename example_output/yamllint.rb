name :
	 Yamllint
homepage :
	 https://github.com/adrienverge/yamllint
url :
	 https://github.com/adrienverge/yamllint/archive/v1.13.0.tar.gz
description :
	 Linter for YAML files
build_deps :
link_deps :
	 libyaml
	 python
optional_deps :
conflicts :
resource :
	 ['PyYAML', 'pathspec']
	 ['https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/84/2a/bfee636b1e2f7d6e30dd74f49201ccfa5c3cf322d44929ecc6c137c486c5/pathspec-0.5.9.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
