name :
	 Molecule
homepage :
	 https://molecule.readthedocs.io
url :
	 https://files.pythonhosted.org/packages/aa/0f/dc6393eed9588e477a23488fbd23efd40246fcc64815179db6c8c892f554/molecule-1.25.1.tar.gz
description :
	 Automated testing for Ansible roles
build_deps :
link_deps :
	 openssl
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["python@2"].opt_libexec/"bin"
	 virtualenv_install_with_resources
