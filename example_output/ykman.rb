name :
	 Ykman
homepage :
	 https://developers.yubico.com/yubikey-manager/
url :
	 https://developers.yubico.com/yubikey-manager/Releases/yubikey-manager-1.0.1.tar.gz
description :
	 Tool for managing your YubiKey configuration
build_deps :
	 swig
link_deps :
	 libusb
	 openssl
	 python
	 ykpers
optional_deps :
conflicts :
resource :
	 ['asn1crypto', 'cffi', 'click', 'cryptography', 'fido2', 'idna', 'ipaddress', 'pycparser', 'pyOpenSSL', 'pyscard', 'pyusb', 'six']
	 ['https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/22/21/233e38f74188db94e8451ef6385754a98f3cad9b59bedf3a8e8b14988be4/cryptography-2.3.1.tar.gz', 'https://files.pythonhosted.org/packages/58/0d/655ef526ab14b8eecc70f773294f15b23402d5184da290c4f23d5d893048/fido2-0.4.0.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f/ipaddress-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a/pycparser-2.19.tar.gz', 'https://files.pythonhosted.org/packages/9b/7c/ee600b2a9304d260d96044ab5c5e57aa489755b92bbeb4c0803f9504f480/pyOpenSSL-18.0.0.tar.gz', 'https://files.pythonhosted.org/packages/17/f3/e6e52e3dab39b26450d9fb6385c4a40f883180d6f1ee26ad4567dd243edc/pyscard-1.9.7.tar.gz', 'https://files.pythonhosted.org/packages/5f/34/2095e821c01225377dda4ebdbd53d8316d6abb243c9bee43d3888fa91dd6/pyusb-1.0.2.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
