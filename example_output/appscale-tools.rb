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
