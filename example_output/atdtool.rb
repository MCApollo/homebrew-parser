name :
	 Atdtool
homepage :
	 https://github.com/lpenz/atdtool
url :
	 https://github.com/lpenz/atdtool/archive/upstream/1.3.3.tar.gz
description :
	 Command-line interface for After the Deadline language checker
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 prefix.install libexec/"share"
