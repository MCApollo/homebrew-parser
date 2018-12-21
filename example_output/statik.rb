name :
	 Statik
homepage :
	 https://getstatik.com
url :
	 https://github.com/thanethomson/statik/archive/v0.22.2.tar.gz
description :
	 Python-based, generic static web site generator aimed at developers
build_deps :
link_deps :
	 python@2
conflicts :
	 go-statik
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "statik"
	 venv.pip_install_and_link buildpath
