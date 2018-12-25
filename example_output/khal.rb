name :
	 Khal
homepage :
	 https://lostpackets.de/khal/
url :
	 https://github.com/pimutils/khal.git
description :
	 CLI calendar application
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", name
	 venv.pip_install_and_link buildpath
