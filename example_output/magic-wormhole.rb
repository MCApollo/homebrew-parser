name :
	 MagicWormhole
homepage :
	 https://github.com/warner/magic-wormhole
url :
	 https://files.pythonhosted.org/packages/a2/1e/1566408c0cae5c565297f7d087404d7fc18d950f1fc12f34862c47d60698/magic-wormhole-0.11.0.tar.gz
description :
	 Securely transfers data between computers
build_deps :
link_deps :
	 libsodium
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV["SODIUM_INSTALL"] = "system"
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resource("cffi")
	 virtualenv_install_with_resources
