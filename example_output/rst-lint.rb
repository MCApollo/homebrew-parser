name :
	 RstLint
homepage :
	 https://github.com/twolfson/restructuredtext-lint
url :
	 https://github.com/twolfson/restructuredtext-lint/archive/1.2.1.tar.gz
description :
	 ReStructuredText linter
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['docutils']
	 ['https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
