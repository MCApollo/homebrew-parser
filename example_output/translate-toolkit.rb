name :
	 TranslateToolkit
homepage :
	 https://toolkit.translatehouse.org/
url :
	 https://github.com/translate/translate/archive/2.3.1.tar.gz
description :
	 Toolkit for localization engineers
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
