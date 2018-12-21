name :
	 DockerCloud
homepage :
	 https://cloud.docker.com/
url :
	 https://files.pythonhosted.org/packages/78/75/511a967ccabff691b57f97bde04cff29af2f493c6ec91a5f57c42badc3b0/docker-cloud-1.0.9.tar.gz
description :
	 SaaS to build, deploy and manage Docker-based applications
build_deps :
link_deps :
	 libyaml
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
