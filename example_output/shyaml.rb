name :
	 Shyaml
homepage :
	 https://github.com/0k/shyaml
url :
	 https://files.pythonhosted.org/packages/33/34/7ad4b645bdd5c6cd100748fc2429924b553439221aa9b9386f658e5a05f2/shyaml-0.5.2.tar.gz
description :
	 Command-line YAML parser
build_deps :
link_deps :
	 libyaml
	 python
optional_deps :
conflicts :
resource :
	 ['PyYAML']
	 ['https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
