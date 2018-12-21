name :
	 Bzt
homepage :
	 https://gettaurus.org
url :
	 https://files.pythonhosted.org/packages/source/b/bzt/bzt-1.13.2.tar.gz
description :
	 BlazeMeter Taurus
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 virtualenv_install_with_resources
