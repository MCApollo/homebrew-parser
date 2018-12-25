name :
	 Muttils
homepage :
	 https://bitbucket.org/blacktrash/muttils/
url :
	 https://bitbucket.org/blacktrash/muttils/get/1.3.tar.gz
description :
	 Provides utilities for use with console mail clients, eg. Mutt
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
