name :
	 Uhd
homepage :
	 https://files.ettus.com/manual/
url :
	 https://github.com/EttusResearch/uhd/archive/v3.13.0.2.tar.gz
description :
	 Hardware driver for all USRP devices
build_deps :
	 cmake
	 doxygen
link_deps :
	 boost
	 libusb
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resource("Mako").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
