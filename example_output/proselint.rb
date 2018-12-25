name :
	 Proselint
homepage :
	 http://proselint.com
url :
	 https://files.pythonhosted.org/packages/42/ff/8e7ad0108b8faffdf2ec7d170b4a8a3c9bc91f5077debf5381ef14702588/proselint-0.10.2.tar.gz
description :
	 Linter for prose
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['click', 'future', 'six']
	 ['https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
