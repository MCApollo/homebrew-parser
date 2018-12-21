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
