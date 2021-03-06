name :
	 SpoofMac
homepage :
	 https://github.com/feross/SpoofMAC
url :
	 https://files.pythonhosted.org/packages/9c/59/cc52a4c5d97b01fac7ff048353f8dc96f217eadc79022f78455e85144028/SpoofMAC-2.1.1.tar.gz
description :
	 Spoof your MAC address in macOS
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['docopt']
	 ['https://files.pythonhosted.org/packages/source/d/docopt/docopt-0.6.2.tar.gz']
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = libexec/"lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage { system "python", *Language::Python.setup_install_args(libexec/"vendor") }
	 end
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
