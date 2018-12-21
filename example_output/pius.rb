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
conflicts :
patches :
EOF_patch :
install :
	 inreplace "libpius/constants.py", %r{/usr/bin/gpg2?}, "/usr/bin/env gpg"
	 virtualenv_install_with_resources
