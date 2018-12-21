name :
	 Streamlink
homepage :
	 https://streamlink.github.io/
url :
	 https://github.com/streamlink/streamlink/releases/download/0.14.2/streamlink-0.14.2.tar.gz
description :
	 CLI for extracting streams from various websites to a video player
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
