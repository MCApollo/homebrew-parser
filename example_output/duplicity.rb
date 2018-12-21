name :
	 Duplicity
homepage :
	 https://launchpad.net/duplicity
url :
	 https://launchpad.net/duplicity/0.7-series/0.7.18.2/+download/duplicity-0.7.18.2.tar.gz
description :
	 Bandwidth-efficient encrypted backup
build_deps :
link_deps :
	 gnupg
	 librsync
	 openssl
	 python@2
	 par2
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 inreplace Dir[bin/"*"], %r{^#!/usr/bin/env python.*$},
	 "#!#{libexec}/bin/python"
	 man1.install Dir[libexec/"share/man/man1/*"]
