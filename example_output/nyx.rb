name :
	 Nyx
homepage :
	 https://nyx.torproject.org/
url :
	 https://files.pythonhosted.org/packages/42/37/85890dae5680f36f5b1c964ad41674ebb8d1186383fbca58f82e76de734c/nyx-2.0.4.tar.gz
description :
	 Command-line monitor for Tor
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resource("stem").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
