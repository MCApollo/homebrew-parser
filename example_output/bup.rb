name :
	 Bup
homepage :
	 https://github.com/bup/bup
url :
	 https://github.com/bup/bup/archive/0.29.2.tar.gz
description :
	 Backup tool
build_deps :
	 pandoc
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
