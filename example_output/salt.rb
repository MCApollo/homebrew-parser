name :
	 Salt
homepage :
	 https://s.saltstack.com/community/
url :
	 https://files.pythonhosted.org/packages/9b/84/48b46bad5fa13b47c10a71b4f58cf0f3a30fcb32b6a6599fca454b8c6256/salt-2018.3.2.tar.gz
description :
	 Dynamic infrastructure communication bus
build_deps :
	 swig
link_deps :
	 libgit2
	 libyaml
	 openssl
	 python@2
	 zeromq
optional_deps :
conflicts :
resource :
	 ['Jinja2', 'M2Crypto', 'MarkupSafe', 'PyYAML', 'backports_abc', 'certifi', 'cffi', 'chardet', 'futures', 'idna', 'msgpack', 'pycparser', 'pycrypto', 'pygit2', 'pyzmq', 'requests', 'singledispatch', 'six', 'tornado', 'typing', 'urllib3']
	 ['https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz', 'https://files.pythonhosted.org/packages/41/50/7d85dc99b1c4f29eca83873d851ec29a8e484a66b31351e62e30be9db7d1/M2Crypto-0.30.1.tar.gz', 'https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz', 'https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz', 'https://files.pythonhosted.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8/backports_abc-0.5.tar.gz', 'https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/1f/9e/7b2ff7e965fc654592269f2906ade1c7d705f1bf25b7d469fa153f7d19eb/futures-3.2.0.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/f3/b6/9affbea179c3c03a0eb53515d9ce404809a122f76bee8fc8c6ec9497f51f/msgpack-0.5.6.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz', 'https://files.pythonhosted.org/packages/fe/48/f85a605b7337b5562dff902ba1a50d8f22d399e0b623d0c48363dc84fa81/pygit2-0.27.1.tar.gz', 'https://files.pythonhosted.org/packages/9f/f6/85a33a25128a4a812c3482547e3d458eebdb19ee0b4699f9199cdb2ad731/pyzmq-17.0.0.tar.gz', 'https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz', 'https://files.pythonhosted.org/packages/d9/e9/513ad8dc17210db12cb14f2d4d190d618fb87dd38814203ea71c87ba5b68/singledispatch-3.4.0.3.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/e3/7b/e29ab3d51c8df66922fea216e2bddfcb6430fb29620e5165b16a216e0d3c/tornado-4.5.3.tar.gz', 'https://files.pythonhosted.org/packages/ec/cc/28444132a25c113149cec54618abc909596f0b272a74c55bab9593f8876c/typing-3.6.4.tar.gz', 'https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz']
patches :
EOF_patch :
install :
	 ENV["SWIG_FEATURES"]="-I#{Formula["openssl"].opt_include}"
	 virtualenv_install_with_resources
	 prefix.install libexec/"share"
	 (etc/"saltstack").install (buildpath/"conf").children
