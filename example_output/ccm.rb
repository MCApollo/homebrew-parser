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
optional_deps :
conflicts :
resource :
	 ['PyYAML', 'six', 'cassandra-driver']
	 ['https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/2d/77/2e344b58ffe8b11271735c1ee88fa668c897c5b72ed1913067dd86e1a966/cassandra-driver-3.13.0.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 %w[PyYAML six cassandra-driver].each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
