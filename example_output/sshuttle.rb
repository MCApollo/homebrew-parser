name :
	 Sshuttle
homepage :
	 https://github.com/sshuttle/sshuttle
url :
	 https://github.com/sshuttle/sshuttle.git
description :
	 Proxy server that works as a poor man's VPN
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
