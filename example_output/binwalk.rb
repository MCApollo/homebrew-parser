name :
	 Binwalk
homepage :
	 https://github.com/ReFirmLabs/binwalk
url :
	 https://github.com/ReFirmLabs/binwalk/archive/v2.1.1.tar.gz
description :
	 Searches a binary image for embedded files and executable code
build_deps :
	 swig
link_deps :
	 gcc
	 p7zip
	 python
	 ssdeep
	 xz
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 %w[numpy scipy].each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
