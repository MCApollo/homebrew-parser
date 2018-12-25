name :
	 GitReview
homepage :
	 https://git.openstack.org/cgit/openstack-infra/git-review
url :
	 https://files.pythonhosted.org/packages/f9/d5/c4d61b4f44db860a0ec61da6c713e55eb037bd37c31ec834137b97e3e89e/git-review-1.27.0.tar.gz
description :
	 Submit git branches to gerrit for review
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['certifi', 'chardet', 'idna', 'requests', 'urllib3']
	 ['https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/97/10/92d25b93e9c266c94b76a5548f020f3f1dd0eb40649cb1993532c0af8f4c/requests-2.20.0.tar.gz', 'https://files.pythonhosted.org/packages/a5/74/05ffd00b4b5c08306939c485869f5dc40cbc27357195b0a98b18e4c48893/urllib3-1.24.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", "#{libexec}/vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", "#{libexec}/lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 man1.install gzip("git-review.1")
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
