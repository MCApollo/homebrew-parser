name :
	 Credstash
homepage :
	 https://github.com/fugue/credstash
url :
	 https://files.pythonhosted.org/packages/5f/fa/c10fd986419d489e72ed1e0d94424e848ad1dba82ed5299b472ac8618689/credstash-1.15.0.tar.gz
description :
	 Little utility for managing credentials in the cloud
build_deps :
link_deps :
	 openssl
	 python
optional_deps :
conflicts :
resource :
	 ['asn1crypto', 'boto3', 'botocore', 'cffi', 'cryptography', 'docutils', 'idna', 'ipaddress', 'jmespath', 'pycparser', 'python-dateutil', 's3transfer', 'six', 'urllib3']
	 ['https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz', 'https://files.pythonhosted.org/packages/4c/3c/920aa91d9628d1c79f4793ee23dd8f3049cacebde4947856892397c0ccf9/boto3-1.9.22.tar.gz', 'https://files.pythonhosted.org/packages/cb/8a/129ec483b581ead78ee08033b9db247c218eb20a59167f4c5aa03aa83055/botocore-1.12.22.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/22/21/233e38f74188db94e8451ef6385754a98f3cad9b59bedf3a8e8b14988be4/cryptography-2.3.1.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f/ipaddress-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz', 'https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a/pycparser-2.19.tar.gz', 'https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz', 'https://files.pythonhosted.org/packages/9a/66/c6a5ae4dbbaf253bd662921b805e4972451a6d214d0dc9fb3300cb642320/s3transfer-0.1.13.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
