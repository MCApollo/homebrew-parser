name :
	 EyeD3
homepage :
	 http://eyed3.nicfit.net/
url :
	 http://eyed3.nicfit.net/releases/eyeD3-0.8.7.tar.gz
description :
	 Work with ID3 metadata in .mp3 files
build_deps :
link_deps :
	 libmagic
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
	 system "python3", "setup.py", "install", "--prefix=#{libexec}"
	 share.install "docs/plugins", "docs/cli.rst"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
