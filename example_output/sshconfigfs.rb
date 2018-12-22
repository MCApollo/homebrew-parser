name :
	 Sshconfigfs
homepage :
	 https://github.com/markhellewell/sshconfigfs
url :
	 https://github.com/markhellewell/sshconfigfs/archive/0.3.tar.gz
description :
	 FUSE filesystem to dynamically build SSH config
build_deps :
link_deps :
	 :osxfuse
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resource("fusepy").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 bin.install "sshconfigfs.py" => "sshconfigfs"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
