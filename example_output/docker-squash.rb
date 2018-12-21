name :
	 DockerSquash
homepage :
	 https://github.com/goldmann/docker-squash
url :
	 https://github.com/goldmann/docker-squash/archive/1.0.7.tar.gz
description :
	 Docker image squashing tool
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
