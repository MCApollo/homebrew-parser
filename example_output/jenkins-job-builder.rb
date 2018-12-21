name :
	 JenkinsJobBuilder
homepage :
	 https://docs.openstack.org/infra/system-config/jjb.html
url :
	 https://files.pythonhosted.org/packages/91/9b/ee136841a4d0ec799656e9ccc25becaa416aa680efc230320607bc27c1c6/jenkins-job-builder-2.3.0.tar.gz
description :
	 Configure Jenkins jobs with YAML files stored in Git
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |resource|
	 resource.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
