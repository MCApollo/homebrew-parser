name :
	 Buku
homepage :
	 https://github.com/jarun/Buku
url :
	 https://github.com/jarun/Buku/archive/v4.0.tar.gz
description :
	 Powerful command-line bookmark manager
build_deps :
link_deps :
	 openssl
	 python
optional_deps :
conflicts :
resource :
	 ['asn1crypto', 'beautifulsoup4', 'certifi', 'cffi', 'cryptography', 'html5lib', 'idna', 'pycparser', 'six', 'urllib3', 'webencodings']
	 ['https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz', 'https://files.pythonhosted.org/packages/88/df/86bffad6309f74f3ff85ea69344a078fc30003270c8df6894fca7a3c72ff/beautifulsoup4-4.6.3.tar.gz', 'https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/22/21/233e38f74188db94e8451ef6385754a98f3cad9b59bedf3a8e8b14988be4/cryptography-2.3.1.tar.gz', 'https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f/html5lib-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a/pycparser-2.19.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/a5/74/05ffd00b4b5c08306939c485869f5dc40cbc27357195b0a98b18e4c48893/urllib3-1.24.tar.gz', 'https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 inreplace "buku.py", "#!/usr/bin/env python3", "#!#{libexec}/bin/python"
	 bin.install "buku.py" => "buku"
	 man1.install "buku.1"
	 bash_completion.install "auto-completion/bash/buku-completion.bash"
	 fish_completion.install "auto-completion/fish/buku.fish"
	 zsh_completion.install "auto-completion/zsh/_buku"
