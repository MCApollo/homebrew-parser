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
optional_deps :
conflicts :
	 findbugs
resource :
	 ['pycurl', 'pyxdg']
	 ['https://files.pythonhosted.org/packages/12/3f/557356b60d8e59a1cce62ffc07ecc03e4f8a202c86adae34d895826281fb/pycurl-7.43.0.tar.gz', 'https://files.pythonhosted.org/packages/26/28/ee953bd2c030ae5a9e9a0ff68e5912bd90ee50ae766871151cd2572ca570/pyxdg-0.25.tar.gz']
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
	 end
	 system "python3", *args
	 end
	 resource("pyxdg").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 inreplace "fb", "#!/usr/bin/env python", "#!/usr/bin/env python3"
	 system "make", "PREFIX=#{prefix}", "install"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
