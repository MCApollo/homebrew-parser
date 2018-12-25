name :
	 Pygitup
homepage :
	 https://github.com/msiemens/PyGitUp
url :
	 https://files.pythonhosted.org/packages/12/e8/fd6a0f29c6b7ecb52dc1e9bec96825a1a0ff0f2ce34cd50898040cce9673/git-up-1.5.0.tar.gz
description :
	 Nicer 'git pull'
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['click', 'colorama', 'gitdb2', 'GitPython', 'six', 'smmap2', 'termcolor']
	 ['https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz', 'https://files.pythonhosted.org/packages/84/11/22e68bd46fd545b17d0a0b200cf75c20e9e7b817726a69ad5f3070fd0d3c/gitdb2-2.0.3.tar.gz', 'https://files.pythonhosted.org/packages/f1/e4/2879ab718c80bc9261b34f214e27280f63437068582f8813ff2552373196/GitPython-2.1.10.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/48/d8/25d9b4b875ab3c2400ec7794ceda8093b51101a9d784da608bf65ab5f5f5/smmap2-2.0.3.tar.gz', 'https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
