name :
	 Credstash
homepage :
	 https://github.com/fugue/credstash
url :
	 https://files.pythonhosted.org/packages/5f/fa/c10fd986419d489e72ed1e0d94424e848ad1dba82ed5299b472ac8618689/credstash-1.15.0.tar.gz
description :
	 Little utility for managing credentials in the cloud
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
