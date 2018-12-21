name :
	 BzrFastimport
homepage :
	 https://launchpad.net/bzr-fastimport
url :
	 https://launchpad.net/bzr-fastimport/trunk/0.13.0/+download/bzr-fastimport-0.13.0.tar.gz
description :
	 Bazaar plugin for fast loading of revision control
build_deps :
link_deps :
	 bazaar
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 resource("python-fastimport").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
