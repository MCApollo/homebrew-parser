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
optional_deps :
conflicts :
resource :
	 ['backports.ssl_match_hostname', 'certifi', 'chardet', 'docker', 'docker-pycreds', 'idna', 'ipaddress', 'requests', 'six', 'urllib3', 'websocket-client']
	 ['https://files.pythonhosted.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23/backports.ssl_match_hostname-3.5.0.1.tar.gz', 'https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/e0/d7/5631c05977c51c1fc88b2eba9fd5cb0ecd7859f2ddfa7dfc653c06fcfe3a/docker-3.3.0.tar.gz', 'https://files.pythonhosted.org/packages/9e/7a/109e0a3cc3c19534edd843c16e792c67911b5b4072fdd34ddce90d49f355/docker-pycreds-0.3.0.tar.gz', 'https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz', 'https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f/ipaddress-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz', 'https://files.pythonhosted.org/packages/28/85/df04ec21c622728316b591c2852fd20a0e74324eeb6ca26f351844ba815f/websocket_client-0.48.0.tar.gz']
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
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
