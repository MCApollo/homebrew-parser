name :
	 Xdot
homepage :
	 https://github.com/jrfonseca/xdot.py
url :
	 https://files.pythonhosted.org/packages/75/d3/89151e5c24f59ac5577368651f9d2a5db3cdd870e8f96896e505cb876187/xdot-0.9.tar.gz
description :
	 Interactive viewer for graphs written in Graphviz's dot language
build_deps :
link_deps :
	 gtk+3
	 py3cairo
	 pygobject3
	 python
optional_deps :
conflicts :
resource :
	 ['graphviz']
	 ['https://files.pythonhosted.org/packages/fa/d1/63b62dee9e55368f60b5ea445e6afb361bb47e692fc27553f3672e16efb8/graphviz-0.8.2.zip']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resource("graphviz").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
