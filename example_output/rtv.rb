name :
	 Rtv
homepage :
	 https://github.com/michael-lazar/rtv
url :
	 https://github.com/michael-lazar/rtv/archive/v1.24.0.tar.gz
description :
	 Command-line Reddit client
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", name
	 venv.pip_install_and_link buildpath
