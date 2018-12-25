name :
	 Sslyze
homepage :
	 https://github.com/nabla-c0d3/sslyze
url :
	 https://github.com/nabla-c0d3/sslyze/archive/1.4.3.tar.gz
description :
	 SSL scanner
build_deps :
link_deps :
	 :arch
	 python@2
optional_deps :
conflicts :
resource :
	 ['nassl', 'asn1crypto', 'cffi', 'cryptography', 'enum34', 'idna', 'ipaddress', 'pycparser', 'six', 'tls-parser', 'typing', 'zlib', 'openssl-legacy', 'openssl-modern']
	 ['https://github.com/nabla-c0d3/nassl/archive/1.1.3.tar.gz', 'https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/ec/b2/faa78c1ab928d2b2c634c8b41ff1181f0abdd9adf9193211bd606ffa57e2/cryptography-2.2.2.tar.gz', 'https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f/ipaddress-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/49/c4/aa379256eb83469154c671b700b3edb42ae781044a4cd40ae92bff8259c7/tls_parser-1.2.1.tar.gz', 'https://files.pythonhosted.org/packages/ec/cc/28444132a25c113149cec54618abc909596f0b272a74c55bab9593f8876c/typing-3.6.4.tar.gz', 'https://zlib.net/zlib-1.2.11.tar.gz', 'https://ftp.openssl.org/source/old/1.0.2/openssl-1.0.2e.tar.gz', 'https://github.com/openssl/openssl.git']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 res = resources.map(&:name).to_set
	 res -= %w[cryptography nassl openssl-legacy openssl-modern zlib]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 ENV.prepend_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resource("nassl").stage do
	 nassl_path = Pathname.pwd
	 ENV.deparallelize do
	 mv "bin/openssl-legacy/include", "nassl_openssl_legacy_include"
	 mv "bin/openssl-modern/include", "nassl_openssl_modern_include"
	 rm_rf "bin"
	 (nassl_path/"bin/openssl-legacy/darwin64").mkpath
	 (nassl_path/"bin/openssl-modern/darwin64").mkpath
	 mv "nassl_openssl_legacy_include", "bin/openssl-legacy/include"
	 mv "nassl_openssl_modern_include", "bin/openssl-modern/include"
	 (nassl_path/"zlib-#{resource("zlib").version}").install resource("zlib")
	 (nassl_path/"openssl-1.0.2e").install resource("openssl-legacy")
	 (nassl_path/"openssl-master").install resource("openssl-modern")
	 system "python", "build_from_scratch.py"
	 end
	 system "python", "run_tests.py"
	 venv.pip_install nassl_path
	 ENV.prepend "CPPFLAGS", "-I#{nassl_path}/bin/openssl-modern/include"
	 ENV.prepend "LDFLAGS", "-L#{nassl_path}/bin/openssl-modern/darwin64"
	 venv.pip_install resource("cryptography")
	 end
	 venv.pip_install_and_link buildpath
