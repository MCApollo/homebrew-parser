name :
	 YleDl
homepage :
	 https://aajanki.github.io/yle-dl/index-en.html
url :
	 https://github.com/aajanki/yle-dl/archive/20181103.tar.gz
description :
	 Download Yle videos from the command-line
build_deps :
link_deps :
	 python
	 rtmpdump
optional_deps :
conflicts :
resource :
	 ['AdobeHDS.php', 'attrs', 'certifi', 'chardet', 'defusedxml', 'future', 'idna', 'lxml', 'Mini-AMF', 'pycryptodomex', 'PySocks', 'requests', 'six', 'urllib3', 'configargparse']
	 ['https://raw.githubusercontent.com/K-S-V/Scripts/7fea932cb012cba8c203d5b46b891167b0f609a6/AdobeHDS.php', 'https://files.pythonhosted.org/packages/0f/9e/26b1d194aab960063b266170e53c39f73ea0d0d3f5ce23313e0ec8ee9bdf/attrs-18.2.0.tar.gz', 'https://files.pythonhosted.org/packages/e1/0f/f8d5e939184547b3bdc6128551b831a62832713aa98c2ccdf8c47ecc7f17/certifi-2018.8.24.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/74/ba/4ba4e89e21b5a2e267d80736ea674609a0a33cc4435a6d748ef04f1f9374/defusedxml-0.5.0.tar.gz', 'https://files.pythonhosted.org/packages/90/52/e20466b85000a181e1e144fd8305caf2cf475e2f9674e797b222f8105f5f/future-0.17.1.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/4b/20/ddf5eb3bd5c57582d2b4652b4bbcf8da301bdfe5d805cb94e805f4d7464d/lxml-4.2.5.tar.gz', 'https://files.pythonhosted.org/packages/c9/a1/153af98d9ca4ae24fb67ab5cb8e4de8ad44fd991739f32d12b9321d6955d/Mini-AMF-0.9.1.tar.gz', 'https://files.pythonhosted.org/packages/69/e7/5c50af65e3d46a161181089aed939bce185ad61f6cc86779994e9d8280d0/pycryptodomex-3.7.0.tar.gz', 'https://files.pythonhosted.org/packages/53/12/6bf1d764f128636cef7408e8156b7235b150ea31650d0260969215bb8e7d/PySocks-1.6.8.tar.gz', 'https://files.pythonhosted.org/packages/40/35/298c36d839547b50822985a2cf0611b3b978a5ab7a5af5562b8ebe3e1369/requests-2.20.1.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz', 'https://files.pythonhosted.org/packages/77/61/ae928ce6ab85d4479ea198488cf5ffa371bd4ece2030c0ee85ff668deac5/ConfigArgParse-0.13.0.tar.gz']
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 (resources - [resource("AdobeHDS.php")]).each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 resource("AdobeHDS.php").stage(pkgshare)
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
