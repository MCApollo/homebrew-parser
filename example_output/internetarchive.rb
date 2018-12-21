name :
	 Internetarchive
homepage :
	 https://github.com/jjjake/internetarchive
url :
	 https://files.pythonhosted.org/packages/a6/11/461f00d057a39f987c293cd9122ae3c1e13eb000a317d59c4cd00b84446d/internetarchive-1.7.7.tar.gz
description :
	 Python wrapper for the various Internet Archive APIs
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bin.install_symlink libexec/"bin/ia"
