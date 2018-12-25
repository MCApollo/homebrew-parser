name :
	 Legit
homepage :
	 https://www.git-legit.org/
url :
	 https://files.pythonhosted.org/packages/44/72/a086485566cf7b5ff7b6858b7dc144c76323e021d88f455ceacd5a6c02fd/legit-1.0.1.tar.gz
description :
	 Command-line interface for Git, optimized for workflow simplicity
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['appdirs', 'args', 'click', 'clint', 'colorama', 'crayons', 'gitdb2', 'GitPython', 'packaging', 'pyparsing', 'six', 'smmap2']
	 ['https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz', 'https://files.pythonhosted.org/packages/e5/1c/b701b3f4bd8d3667df8342f311b3efaeab86078a840fb826bd204118cc6b/args-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/3d/b4/41ecb1516f1ba728f39ee7062b9dac1352d39823f513bb6f9e8aeb86e26d/clint-0.5.1.tar.gz', 'https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz', 'https://files.pythonhosted.org/packages/14/fa/635fdd47686a0f29692d927333fcf39e0279fc39c81704866c97adc34053/crayons-0.1.2.tar.gz', 'https://files.pythonhosted.org/packages/84/11/22e68bd46fd545b17d0a0b200cf75c20e9e7b817726a69ad5f3070fd0d3c/gitdb2-2.0.3.tar.gz', 'https://files.pythonhosted.org/packages/1c/08/a2b5ba4ad43c4c33066ced2c45958593ab2554bb0d09f7ecb9bf9092e5f6/GitPython-2.1.8.tar.gz', 'https://files.pythonhosted.org/packages/77/32/439f47be99809c12ef2da8b60a2c47987786d2c6c9205549dd6ef95df8bd/packaging-17.1.tar.gz', 'https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/48/d8/25d9b4b875ab3c2400ec7794ceda8093b51101a9d784da608bf65ab5f5f5/smmap2-2.0.3.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bash_completion.install "extra/bash-completion/legit"
	 zsh_completion.install "extra/zsh-completion/_legit"
	 man1.install "extra/man/legit.1"
