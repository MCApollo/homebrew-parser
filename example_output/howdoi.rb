name :
	 Howdoi
homepage :
	 https://github.com/gleitz/howdoi
url :
	 https://files.pythonhosted.org/packages/bc/21/87dd3caacaa7c372a9838de8e2a2a9640043e72f382cf1300574e78e9a86/howdoi-1.1.13.tar.gz
description :
	 Instant coding answers via the command-line
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
