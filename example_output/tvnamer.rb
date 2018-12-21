name :
	 Tvnamer
homepage :
	 https://github.com/dbr/tvnamer
url :
	 https://github.com/dbr/tvnamer/archive/2.4.tar.gz
description :
	 Automatic TV episode file renamer that uses data from thetvdb.com
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
