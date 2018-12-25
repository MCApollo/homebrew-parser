name :
	 Pius
homepage :
	 https://www.phildev.net/pius/
url :
	 https://github.com/jaymzh/pius/archive/v2.2.6.tar.gz
description :
	 PGP individual UID signer
build_deps :
link_deps :
	 gnupg
	 python
optional_deps :
conflicts :
resource :
	 ['six']
	 ['https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 inreplace "libpius/constants.py", %r{/usr/bin/gpg2?}, "/usr/bin/env gpg"
	 virtualenv_install_with_resources
