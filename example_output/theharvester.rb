name :
	 Theharvester
homepage :
	 http://www.edge-security.com/theharvester.php
url :
	 https://github.com/laramies/theHarvester/archive/v3.0.1.tar.gz
description :
	 Gather materials from public sources (for pen testers)
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV["PYTHONPATH"] = libexec/"lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
