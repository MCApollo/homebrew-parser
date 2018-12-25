name :
	 Black
homepage :
	 https://black.readthedocs.io/en/stable/
url :
	 https://files.pythonhosted.org/packages/e8/5f/0f79fcd943ba465cbd4bf303c9794970c13a95e5456630de9f72e7f37ad4/black-18.9b0.tar.gz
description :
	 Python code formatter
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['appdirs', 'attrs', 'click', 'toml']
	 ['https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz', 'https://files.pythonhosted.org/packages/e4/ac/a04671e118b57bee87dabca1e0f2d3bda816b7a551036012d0ca24190e71/attrs-18.1.0.tar.gz', 'https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/f5/f9/044110c267e6408013b85166a7cfcd352cf85275aa8ce700aa5c0eb407ba/toml-0.9.4.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
