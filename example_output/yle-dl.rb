name :
	 YleDl
homepage :
	 https://aajanki.github.io/yle-dl/index-en.html
url :
	 https://github.com/aajanki/yle-dl/archive/20181103.tar.gz
description :
	 Download Yle videos from the command-line
build_deps :
link_deps :
	 python
	 rtmpdump
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 (resources - [resource("AdobeHDS.php")]).each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 resource("AdobeHDS.php").stage(pkgshare)
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
