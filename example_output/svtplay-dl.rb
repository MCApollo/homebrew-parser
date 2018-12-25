name :
	 SvtplayDl
homepage :
	 https://svtplay-dl.se/
url :
	 https://files.pythonhosted.org/packages/1f/95/5ef43ad627206dbfbca43e377a855a37aa8d005f136ff43974ba6b30fd3e/svtplay-dl-2.1.tar.gz
description :
	 Download videos from https://www.svtplay.se/
build_deps :
link_deps :
	 openssl
	 python
	 rtmpdump
optional_deps :
conflicts :
resource :
	 ['pycryptodome', 'certifi', 'chardet', 'idna', 'PySocks', 'requests', 'urllib3', 'pyyaml']
	 ['https://files.pythonhosted.org/packages/46/57/3901d4d3c03c3a7cefc570c01dfca3ec5eb086fc6e918b4aa451cb63fcdf/pycryptodome-3.7.0.tar.gz', 'https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/53/12/6bf1d764f128636cef7408e8156b7235b150ea31650d0260969215bb8e7d/PySocks-1.6.8.tar.gz', 'https://files.pythonhosted.org/packages/97/10/92d25b93e9c266c94b76a5548f020f3f1dd0eb40649cb1993532c0af8f4c/requests-2.20.0.tar.gz', 'https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
