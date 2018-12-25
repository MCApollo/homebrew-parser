name :
	 Httpie
homepage :
	 https://httpie.org/
url :
	 https://files.pythonhosted.org/packages/09/8d/581ef7bd9a09dc30b621638a4fa805a2073bbfb45fa06ed37f998f172419/httpie-1.0.2.tar.gz
description :
	 User-friendly cURL replacement (command-line HTTP client)
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['Pygments', 'requests', 'certifi', 'urllib3', 'idna', 'chardet', 'PySocks']
	 ['https://files.pythonhosted.org/packages/63/a2/91c31c4831853dedca2a08a0f94d788fc26a48f7281c99a303769ad2721b/Pygments-2.3.0.tar.gz', 'https://files.pythonhosted.org/packages/40/35/298c36d839547b50822985a2cf0611b3b978a5ab7a5af5562b8ebe3e1369/requests-2.20.1.tar.gz', 'https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz', 'https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/53/12/6bf1d764f128636cef7408e8156b7235b150ea31650d0260969215bb8e7d/PySocks-1.6.8.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
