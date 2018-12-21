name :
	 S3cmd
homepage :
	 https://s3tools.org/s3cmd
url :
	 https://downloads.sourceforge.net/project/s3tools/s3cmd/2.0.2/s3cmd-2.0.2.tar.gz
description :
	 Command-line tool for the Amazon S3 service
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
	 r.stage { system "python3", *Language::Python.setup_install_args(libexec/"vendor") }
