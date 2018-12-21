name :
	 Ccm
homepage :
	 https://github.com/pcmanus/ccm
url :
	 https://files.pythonhosted.org/packages/fc/ab/b51afd466cc4acf2192e230ddb6fd3adb56066f05c7be1852af7bd655068/ccm-3.1.4.tar.gz
description :
	 Create and destroy an Apache Cassandra cluster on localhost
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 %w[PyYAML six cassandra-driver].each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
