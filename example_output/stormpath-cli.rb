name :
	 StormpathCli
homepage :
	 https://github.com/stormpath/stormpath-cli
url :
	 https://github.com/stormpath/stormpath-cli/archive/0.1.3.tar.gz
description :
	 The official Stormpath command-line client
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 virtualenv_install_with_resources
