name :
	 Glances
homepage :
	 https://nicolargo.github.io/glances/
url :
	 https://github.com/nicolargo/glances/archive/v3.0.2.tar.gz
description :
	 Alternative to top/htop
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['psutil']
	 ['https://files.pythonhosted.org/packages/7d/9a/1e93d41708f8ed2b564395edfa3389f0fd6d567597401c2e5e2775118d8b/psutil-5.4.7.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resource("psutil").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 prefix.install libexec/"share"
