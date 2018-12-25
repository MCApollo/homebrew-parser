name :
	 TranslateToolkit
homepage :
	 https://toolkit.translatehouse.org/
url :
	 https://github.com/translate/translate/archive/2.3.1.tar.gz
description :
	 Toolkit for localization engineers
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['argparse', 'diff-match-patch', 'six']
	 ['https://files.pythonhosted.org/packages/18/dd/e617cfc3f6210ae183374cd9f6a26b20514bbb5a792af97949c5aacddf0f/argparse-1.4.0.tar.gz', 'https://files.pythonhosted.org/packages/22/82/46eaeab04805b4fac17630b59f30c4f2c8860988bcefd730ff4f1992908b/diff-match-patch-20121119.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
