name :
	 RobotFramework
homepage :
	 http://robotframework.org/
url :
	 https://github.com/robotframework/robotframework/archive/v3.0.4.tar.gz
description :
	 Open source test framework for acceptance testing
build_deps :
link_deps :
	 openssl
	 python@2
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
