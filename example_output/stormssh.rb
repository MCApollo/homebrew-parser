name :
	 Stormssh
homepage :
	 https://github.com/emre/storm
url :
	 https://files.pythonhosted.org/packages/0a/18/85d12be676ae0c1d98173b07cc289bbf9e0c67d6c7054b8df3e1003bf992/stormssh-0.7.0.tar.gz
description :
	 Command-line tool to manage your ssh connections
build_deps :
link_deps :
	 python
conflicts :
	 storm
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage { system "python3", *Language::Python.setup_install_args(libexec/"vendor") }
