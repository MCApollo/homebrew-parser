name :
	 Percol
homepage :
	 https://github.com/mooz/percol
url :
	 https://github.com/mooz/percol/archive/v0.2.1.tar.gz
description :
	 Interactive grep tool
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
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
