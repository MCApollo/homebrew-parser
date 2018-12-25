name :
	 Awslogs
homepage :
	 https://github.com/jorgebastida/awslogs
url :
	 https://github.com/jorgebastida/awslogs/archive/0.11.0.tar.gz
description :
	 Simple command-line tool to read AWS CloudWatch logs
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['boto3', 'botocore', 'colorama', 'crayons', 'dateparser', 'docutils', 'jmespath', 'python-dateutil', 'pytz', 'regex', 's3transfer', 'six', 'termcolor', 'tzlocal', 'urllib3']
	 ['https://files.pythonhosted.org/packages/fd/50/3868735fae36e0f93216019551ca0f75b6cf9f933a55891244efefdcc3bd/boto3-1.9.62.tar.gz', 'https://files.pythonhosted.org/packages/da/c5/8fded95d8076d0144cbe3b836277ce234cee86e1b1393f6e6e8bedbf1436/botocore-1.12.62.tar.gz', 'https://files.pythonhosted.org/packages/76/53/e785891dce0e2f2b9f4b4ff5bc6062a53332ed28833c7afede841f46a5db/colorama-0.4.1.tar.gz', 'https://files.pythonhosted.org/packages/14/fa/635fdd47686a0f29692d927333fcf39e0279fc39c81704866c97adc34053/crayons-0.1.2.tar.gz', 'https://files.pythonhosted.org/packages/e7/87/fc2ab653e628e2e51e00115bc9cb14c31afdd03acb710f137056a1c13f7c/dateparser-0.7.0.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz', 'https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0/python-dateutil-2.7.5.tar.gz', 'https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz', 'https://files.pythonhosted.org/packages/16/07/ee3e02770ed456a088b90da7c9b1e9aa227e3c956d37b845cef2aab93764/regex-2018.11.22.tar.gz', 'https://files.pythonhosted.org/packages/9a/66/c6a5ae4dbbaf253bd662921b805e4972451a6d214d0dc9fb3300cb642320/s3transfer-0.1.13.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz', 'https://files.pythonhosted.org/packages/cb/89/e3687d3ed99bc882793f82634e9824e62499fdfdc4b1ae39e211c5b05017/tzlocal-1.5.1.tar.gz', 'https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
