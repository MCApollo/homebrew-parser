name :
	 Honcho
homepage :
	 https://github.com/nickstenning/honcho
url :
	 https://github.com/nickstenning/honcho/archive/v1.0.1.tar.gz
description :
	 Python clone of Foreman, for managing Procfile-based applications
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
