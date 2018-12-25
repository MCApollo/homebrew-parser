name :
	 Mackup
homepage :
	 https://github.com/lra/mackup
url :
	 https://github.com/lra/mackup/archive/0.8.20.tar.gz
description :
	 Keep your Mac's application settings in sync
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['docopt', 'six']
	 ['https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
