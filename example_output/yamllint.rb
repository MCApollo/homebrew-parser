name :
	 Yamllint
homepage :
	 https://github.com/adrienverge/yamllint
url :
	 https://github.com/adrienverge/yamllint/archive/v1.13.0.tar.gz
description :
	 Linter for YAML files
build_deps :
link_deps :
	 libyaml
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
