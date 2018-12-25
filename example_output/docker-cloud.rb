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
optional_deps :
conflicts :
resource :
	 ['ago', 'backports.ssl_match_hostname', 'future', 'python-dateutil', 'python-dockercloud', 'PyYAML', 'requests', 'six', 'tabulate', 'websocket-client']
	 ['https://files.pythonhosted.org/packages/83/1a/17e89f0be2cf69e17fbc96012bd6a2bf6d88a8fd3ac79854cc7007971943/ago-0.0.9.tar.gz', 'https://files.pythonhosted.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23/backports.ssl_match_hostname-3.5.0.1.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz', 'https://files.pythonhosted.org/packages/97/66/776e420e7db5d3c20921e88f1cb333737ace862c8d02234367b32d969525/python-dockercloud-1.0.12.tar.gz', 'https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz', 'https://files.pythonhosted.org/packages/72/46/4abc3f5aaf7bf16a52206bb0c68677a26c216c1e6625c78c5aef695b5359/requests-2.14.2.tar.gz', 'https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/1c/a1/3367581782ce79b727954f7aa5d29e6a439dc2490a9ac0e7ea0a7115435d/tabulate-0.7.7.tar.gz', 'https://files.pythonhosted.org/packages/a7/2b/0039154583cb0489c8e18313aa91ccd140ada103289c5c5d31d80fd6d186/websocket_client-0.40.0.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
