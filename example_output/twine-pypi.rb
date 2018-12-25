name :
	 TwinePypi
homepage :
	 https://github.com/pypa/twine
url :
	 https://files.pythonhosted.org/packages/29/4d/801bbad5968e674c1ca047118025243a475f986a6f5b3ca36e5afece0f9f/twine-1.12.1.tar.gz
description :
	 Utilities for interacting with PyPI
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['bleach', 'certifi', 'cffi', 'chardet', 'cmarkgfm', 'docutils', 'future', 'idna', 'pkginfo', 'pycparser', 'Pygments', 'readme_renderer', 'requests', 'requests-toolbelt', 'six', 'tqdm', 'urllib3', 'webencodings']
	 ['https://files.pythonhosted.org/packages/10/46/14ab80c1a82b038a548d9155ea7ac11592e6bf6389aa9244e6947d085ed4/bleach-3.0.1.tar.gz', 'https://files.pythonhosted.org/packages/e1/0f/f8d5e939184547b3bdc6128551b831a62832713aa98c2ccdf8c47ecc7f17/certifi-2018.8.24.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/e2/a3/4021fbc17c5afe7f307d14eba0d6899a8e66b351ab65649b1c89c50a836d/cmarkgfm-0.4.2.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/39/c9/111ececbeed8e69cd1b6bec79a32a0b0f6074038a4244e58e285ad278248/pkginfo-1.4.2.tar.gz', 'https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a/pycparser-2.19.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/aa/b6/384c1dfe9b3ac3404817ac32fa44abbe0b51c2494ba118e0ad7ff3e72efb/readme_renderer-22.0.tar.gz', 'https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz', 'https://files.pythonhosted.org/packages/86/f9/e80fa23edca6c554f1994040064760c12b51daff54b55f9e379e899cd3d4/requests-toolbelt-0.8.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/5a/53/05ac96b04b6417d5d8d4638ac22e39b39a8c8e5e2a35cda5e8d2efa275c3/tqdm-4.26.0.tar.gz', 'https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz', 'https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 pkgshare.install "tests/fixtures/twine-1.5.0-py2.py3-none-any.whl"
