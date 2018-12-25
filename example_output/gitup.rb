name :
	 Gitup
homepage :
	 https://github.com/earwig/git-repo-updater
url :
	 https://github.com/earwig/git-repo-updater.git
description :
	 Update multiple git repositories at once
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['colorama', 'gitdb2', 'GitPython', 'smmap2']
	 ['https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz', 'https://files.pythonhosted.org/packages/b9/36/4bdb753087a9232899ac482ee2d5da25f50b63998d661aa4e8170acd95b5/gitdb2-2.0.4.tar.gz', 'https://files.pythonhosted.org/packages/4d/e8/98e06d3bc954e3c5b34e2a579ddf26255e762d21eb24fede458eff654c51/GitPython-2.1.11.tar.gz', 'https://files.pythonhosted.org/packages/ad/e9/0fb974b182ff41d28ad267d0b4201b35159619eb610ea9a2e036817cb0b8/smmap2-2.0.4.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
