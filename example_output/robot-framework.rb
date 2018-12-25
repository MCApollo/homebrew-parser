name :
	 RobotFramework
homepage :
	 http://robotframework.org/
url :
	 https://github.com/robotframework/robotframework/archive/v3.0.4.tar.gz
description :
	 Open source test framework for acceptance testing
build_deps :
link_deps :
	 openssl
	 python@2
	 :x11
optional_deps :
conflicts :
resource :
	 ['asn1crypto', 'bcrypt', 'cffi', 'cryptography', 'enum34', 'idna', 'ipaddress', 'paramiko', 'pyasn1', 'pycparser', 'PyNaCl', 'robotframework-archivelibrary', 'robotframework-selenium2library', 'robotframework-seleniumlibrary', 'robotframework-sshlibrary', 'selenium', 'six']
	 ['https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz', 'https://files.pythonhosted.org/packages/f3/ec/bb6b384b5134fd881b91b6aa3a88ccddaad0103857760711a5ab8c799358/bcrypt-3.1.4.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/ec/b2/faa78c1ab928d2b2c634c8b41ff1181f0abdd9adf9193211bd606ffa57e2/cryptography-2.2.2.tar.gz', 'https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz', 'https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz', 'https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f/ipaddress-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/29/65/83181630befb17cd1370a6abb9a87957947a43c2332216e5975353f61d64/paramiko-2.4.1.tar.gz', 'https://files.pythonhosted.org/packages/eb/3d/b7d0fdf4a882e26674c68c20f40682491377c4db1439870f5b6f862f76ed/pyasn1-0.4.2.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/08/19/cf56e60efd122fa6d2228118a9b345455b13ffe16a14be81d025b03b261f/PyNaCl-1.2.1.tar.gz', 'https://files.pythonhosted.org/packages/29/b6/bf5bd38d5764f6afaf17b0debef580aee9bfbd63ad77a0e215389691fdfb/robotframework-archivelibrary-0.4.0.tar.gz', 'https://files.pythonhosted.org/packages/c4/7d/3c07081e7f0f1844aa21fd239a0139db4da5a8dc219d1e81cb004ba1f4e2/robotframework-selenium2library-3.0.0.tar.gz', 'https://files.pythonhosted.org/packages/66/ac/eead7e76d9bd70da601442809268f984cd03f9cb708fed9e087fbc7c7412/robotframework-seleniumlibrary-3.1.1.tar.gz', 'https://files.pythonhosted.org/packages/6e/6c/137995fe4bf8e4bd55f2712923d0acdb07eab6cdc2758d06e01b08345f77/robotframework-sshlibrary-2.1.3.tar.gz', 'https://files.pythonhosted.org/packages/d4/28/8124d32415bd3d67fabea52480395427576b582771283e89ce10a56d9e5b/selenium-3.11.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
