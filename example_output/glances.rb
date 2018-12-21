name :
	 Glances
homepage :
	 https://nicolargo.github.io/glances/
url :
	 https://github.com/nicolargo/glances/archive/v3.0.2.tar.gz
description :
	 Alternative to top/htop
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resource("psutil").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
