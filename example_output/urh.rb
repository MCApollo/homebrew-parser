name :
	 Urh
homepage :
	 https://github.com/jopohl/urh
url :
	 https://files.pythonhosted.org/packages/81/29/8ffecf5a0d99bef5a4463fd9dbea537e119562737aaac10b1997da135d5d/urh-2.2.3.tar.gz
description :
	 Universal Radio Hacker
build_deps :
	 pkg-config
link_deps :
	 hackrf
	 numpy
	 pyqt
	 python
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete "PYTHONPATH"
	 inreplace "src/urh/main.py", "GENERATE_UI = True", "GENERATE_UI = False"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 next if r.name == "Cython"
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
