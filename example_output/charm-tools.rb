name :
	 CharmTools
homepage :
	 https://github.com/juju/charm-tools
url :
	 https://files.pythonhosted.org/packages/99/4d/16d7398fe5eefc602a8870fb3e93597aabe681b0f1497749148695cba4a1/charm-tools-2.2.3.tar.gz
description :
	 Tools for authoring and maintaining juju charms
build_deps :
link_deps :
	 charm
	 libyaml
	 mercurial
	 openssl
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", "/System/Library/Frameworks/Python.framework/Versions/Current/bin"
	 ENV.prepend "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/ffi"
	 virtualenv_install_with_resources
