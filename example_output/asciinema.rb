name :
	 Asciinema
homepage :
	 https://asciinema.org
url :
	 https://github.com/asciinema/asciinema/archive/v2.0.1.tar.gz
description :
	 Record and share terminal sessions
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
