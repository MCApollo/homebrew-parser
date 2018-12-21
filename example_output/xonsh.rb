name :
	 Xonsh
homepage :
	 https://xon.sh/
url :
	 https://github.com/xonsh/xonsh/archive/0.8.3.tar.gz
description :
	 Python-ish, BASHwards-compatible shell language and command prompt
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
