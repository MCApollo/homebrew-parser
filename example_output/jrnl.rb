name :
	 Jrnl
homepage :
	 https://maebert.github.io/jrnl/
url :
	 https://github.com/maebert/jrnl/archive/1.9.8.tar.gz
description :
	 Command-line note taker
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['entrypoints', 'future', 'keyring', 'keyrings.alt', 'parsedatetime', 'pycrypto', 'python-dateutil', 'pytz', 'six', 'tzlocal']
	 ['https://files.pythonhosted.org/packages/27/e8/607697e6ab8a961fc0b141a97ea4ce72cd9c9e264adeb0669f6d194aa626/entrypoints-0.2.3.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/7c/c0/4f48b2b1ff9eec624624142e9be28a6c91b494fd1513df4ef7544da3886c/keyring-15.1.0.tar.gz', 'https://files.pythonhosted.org/packages/3d/94/5953839c03457054707cc72466af7728c0588ca0398d7cab3af40c624393/keyrings.alt-3.1.tar.gz', 'https://files.pythonhosted.org/packages/e3/b3/02385db13f1f25f04ad7895f35e9fe3960a4b9d53112775a6f7d63f264b6/parsedatetime-2.4.tar.gz', 'https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz', 'https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz', 'https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/cb/89/e3687d3ed99bc882793f82634e9824e62499fdfdc4b1ae39e211c5b05017/tzlocal-1.5.1.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
