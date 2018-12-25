name :
	 Py3cairo
homepage :
	 https://cairographics.org/pycairo/
url :
	 https://github.com/pygobject/pycairo/releases/download/v1.18.0/pycairo-1.18.0.tar.gz
description :
	 Python 3 bindings for the Cairo graphics library
build_deps :
	 pkg-config
link_deps :
	 cairo
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "python3", *Language::Python.setup_install_args(prefix)
