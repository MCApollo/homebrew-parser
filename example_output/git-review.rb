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
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", "#{libexec}/vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
