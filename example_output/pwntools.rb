name :
	 Pwntools
homepage :
	 https://github.com/Gallopsled/pwntools
url :
	 https://github.com/Gallopsled/pwntools/archive/3.12.1.tar.gz
description :
	 CTF framework used by Gallopsled in every CTF
build_deps :
link_deps :
	 openssl
	 python@2
conflicts :
	 moreutils
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", name
	 venv.pip_install_and_link buildpath
