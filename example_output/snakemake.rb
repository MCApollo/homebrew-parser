name :
	 Snakemake
homepage :
	 https://snakemake.readthedocs.io/
url :
	 https://files.pythonhosted.org/packages/5a/a5/704ff1f58a121acf8b96f13a9b0abdbbb27a1a78cf52c676bd0bbd2c5f40/snakemake-5.2.2.tar.gz
description :
	 Pythonic workflow system
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['Cython', 'appdirs', 'certifi', 'chardet', 'ConfigArgParse', 'datrie', 'docutils', 'idna', 'jsonschema', 'PyYAML', 'ratelimiter', 'requests', 'urllib3', 'wrapt']
	 ['https://files.pythonhosted.org/packages/d2/12/8ef44cede251b93322e8503fd6e1b25a0249fa498bebec191a5a06adbe51/Cython-0.28.4.tar.gz', 'https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz', 'https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/77/61/ae928ce6ab85d4479ea198488cf5ffa371bd4ece2030c0ee85ff668deac5/ConfigArgParse-0.13.0.tar.gz', 'https://files.pythonhosted.org/packages/44/5f/bf7e4711f6aa95edb2216b3487eeac719645802259643d341668e65636db/datrie-0.7.1.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/58/b9/171dbb07e18c6346090a37f03c7e74410a1a56123f847efed59af260a298/jsonschema-2.6.0.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/5b/e0/b36010bddcf91444ff51179c076e4a09c513674a56758d7cfea4f6520e29/ratelimiter-1.2.0.post0.tar.gz', 'https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz', 'https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz', 'https://files.pythonhosted.org/packages/a0/47/66897906448185fcb77fc3c2b1bc20ed0ecca81a0f2f88eda3fc5a34fc3d/wrapt-1.10.11.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"cython/lib/python#{xy}/site-packages"
	 resource("Cython").stage do
	 system "python3", *Language::Python.setup_install_args(buildpath/"cython")
	 end
	 ENV.prepend_path "PATH", buildpath/"cython/bin"
	 resource("datrie").stage do
	 system "./update_c.sh"
	 ENV.delete "PYTHONPATH"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 resources.each do |r|
	 next if r.name == "datrie" || r.name == "Cython"
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
