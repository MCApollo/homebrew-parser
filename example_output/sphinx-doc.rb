name :
	 SphinxDoc
homepage :
	 https://www.sphinx-doc.org/
url :
	 https://files.pythonhosted.org/packages/4c/ea/7388faba7cf02999e1bc42f6a8eb1ea0120aec3dd93474cee21cea2d693f/Sphinx-1.8.2.tar.gz
description :
	 Tool to create intelligent and beautiful documentation
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
