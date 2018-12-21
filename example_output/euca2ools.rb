name :
	 Euca2ools
homepage :
	 https://github.com/eucalyptus/euca2ools
url :
	 https://downloads.eucalyptus.com/software/euca2ools/3.4/source/euca2ools-3.4.1.tar.xz
description :
	 Eucalyptus client API tools-works with Amazon EC2 and IAM
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
