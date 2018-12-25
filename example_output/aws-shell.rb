name :
	 AwsShell
homepage :
	 https://github.com/awslabs/aws-shell
url :
	 https://files.pythonhosted.org/packages/46/5a/c01bbff96fcbe8051e0b59e6191e07f5917f7f2cf667557c7dcbb85f62c3/aws-shell-0.2.1.tar.gz
description :
	 Integrated shell for working with the AWS CLI
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['awscli', 'boto3', 'botocore', 'colorama', 'configobj', 'docutils', 'jmespath', 'prompt_toolkit', 'pyasn1', 'Pygments', 'python-dateutil', 'PyYAML', 'rsa', 's3transfer', 'six', 'urllib3', 'wcwidth']
	 ['https://files.pythonhosted.org/packages/71/15/06cd2c5ae1646596542aae02d7a2bd86264673909930526d684526545a94/awscli-1.16.19.tar.gz', 'https://files.pythonhosted.org/packages/6d/9b/5cc24eeae40906824bbaea729bf474f6f8429963c8a4c54abc133464ba5a/boto3-1.9.9.tar.gz', 'https://files.pythonhosted.org/packages/09/aa/c48ef4dc4dfcb407a28f18e1904e856ae2a316214514b23cef4331bf4342/botocore-1.12.9.tar.gz', 'https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz', 'https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz', 'https://files.pythonhosted.org/packages/8a/ad/cf6b128866e78ad6d7f1dc5b7f99885fb813393d9860778b2984582e81b5/prompt_toolkit-1.0.15.tar.gz', 'https://files.pythonhosted.org/packages/10/46/059775dc8e50f722d205452bced4b3cc965d27e8c3389156acd3b1123ae3/pyasn1-0.4.4.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/14/89/adf8b72371e37f3ca69c6cb8ab6319d009c4a24b04a31399e5bd77d9bb57/rsa-3.4.2.tar.gz', 'https://files.pythonhosted.org/packages/9a/66/c6a5ae4dbbaf253bd662921b805e4972451a6d214d0dc9fb3300cb642320/s3transfer-0.1.13.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz', 'https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV["PYTHONPATH"] = libexec/"lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 env = {
	 :PATH       => "#{libexec}/vendor/bin:$PATH",
	 :PYTHONPATH => ENV["PYTHONPATH"],
	 }
	 bin.env_script_all_files(libexec/"bin", env)
