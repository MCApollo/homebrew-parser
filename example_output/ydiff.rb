name :
	 Ydiff
homepage :
	 https://github.com/ymattw/ydiff
url :
	 https://github.com/ymattw/ydiff/archive/1.1.tar.gz
description :
	 View colored diff with side by side and auto pager support
build_deps :
link_deps :
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
