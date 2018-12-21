name :
	 FbClient
homepage :
	 https://paste.xinu.at
url :
	 https://paste.xinu.at/data/client/fb-2.0.3.tar.gz
description :
	 Shell-script client for https://paste.xinu.at
build_deps :
	 pkg-config
link_deps :
	 python
conflicts :
	 findbugs
patches :
EOF_patch :
install :
	 ENV.delete "SDKROOT"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resource("pycurl").stage do
	 args = Language::Python.setup_install_args(libexec/"vendor")
	 if MacOS.version >= :high_sierra
	 args << "--libcurl-dll=/usr/lib/libcurl.dylib"
