name :
	 Ipython
homepage :
	 https://ipython.org/
url :
	 https://files.pythonhosted.org/packages/42/bb/0ed1fb1d57d697326f9e9b827d9a74b81dee56031ed7c252bc716195ad7a/ipython-7.2.0.tar.gz
description :
	 Interactive computing in Python
build_deps :
link_deps :
	 python
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 ipykernel = resource("ipykernel")
	 (resources - [ipykernel]).each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 rm_rf etc/"jupyter/kernels/python3"
	 (etc/"jupyter/kernels/python3").install Dir[share/"jupyter/kernels/python3/*"]
