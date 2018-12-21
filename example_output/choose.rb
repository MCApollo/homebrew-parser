name :
	 Choose
homepage :
	 https://github.com/geier/choose
url :
	 https://github.com/geier/choose/archive/v0.1.0.tar.gz
description :
	 Make choices on the command-line
build_deps :
link_deps :
	 python
conflicts :
	 choose-gui
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 resource("urwid").stage do
	 system "python3", *Language::Python.setup_install_args(libexec)
