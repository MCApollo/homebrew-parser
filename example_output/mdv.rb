name :
	 Mdv
homepage :
	 https://github.com/axiros/terminal_markdown_viewer
url :
	 https://github.com/axiros/terminal_markdown_viewer/archive/1.6.3.tar.gz
description :
	 Styled terminal markdown viewer
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['docopt', 'Markdown', 'Pygments', 'PyYAML']
	 ['https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz', 'https://files.pythonhosted.org/packages/d4/32/642bd580c577af37b00a1eb59b0eaa996f2d11dfe394f3dd0c7a8a2de81a/Markdown-2.6.7.tar.gz', 'https://files.pythonhosted.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
