name :
	 AppscaleTools
homepage :
	 https://github.com/AppScale/appscale-tools
url :
	 https://github.com/AppScale/appscale-tools/archive/3.5.3.tar.gz
description :
	 Command-line tools for working with AppScale
build_deps :
link_deps :
	 libyaml
	 openssl
	 python@2
	 ssh-copy-id
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
	 site_packages = libexec/"lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", site_packages
	 system "python", *Language::Python.setup_install_args(libexec)
	 touch site_packages/"appscale/__init__.py"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
