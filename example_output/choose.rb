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
optional_deps :
conflicts :
	 choose-gui
resource :
	 ['urwid']
	 ['https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0/urwid-2.0.1.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 resource("urwid").stage do
	 system "python3", *Language::Python.setup_install_args(libexec)
	 end
	 bin.install "choose"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
