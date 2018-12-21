name :
	 Py2cairo
homepage :
	 https://cairographics.org/pycairo/
url :
	 https://github.com/pygobject/pycairo/releases/download/v1.18.0/pycairo-1.18.0.tar.gz
description :
	 Python 2 bindings for the Cairo graphics library
build_deps :
	 pkg-config
link_deps :
	 cairo
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 system "python", *Language::Python.setup_install_args(prefix)
