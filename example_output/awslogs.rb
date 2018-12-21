name :
	 Awslogs
homepage :
	 https://github.com/jorgebastida/awslogs
url :
	 https://github.com/jorgebastida/awslogs/archive/0.11.0.tar.gz
description :
	 Simple command-line tool to read AWS CloudWatch logs
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
