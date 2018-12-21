name :
	 Twoping
homepage :
	 https://www.finnie.org/software/2ping/
url :
	 https://www.finnie.org/software/2ping/2ping-4.3.tar.gz
description :
	 Ping utility to determine directional packet loss
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 pyver = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{pyver}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 man1.install "doc/2ping.1"
	 man1.install_symlink "2ping.1" => "2ping6.1"
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
