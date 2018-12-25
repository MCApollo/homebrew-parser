name :
	 Conan
homepage :
	 https://github.com/conan-io/conan
url :
	 https://github.com/conan-io/conan/archive/1.10.1.tar.gz
description :
	 Distributed, open source, package manager for C/C++
build_deps :
	 pkg-config
link_deps :
	 libffi
	 openssl
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "conans/requirements.txt", "PyYAML>=3.11, <3.14.0", "PyYAML>=3.11"
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", "PyYAML==3.13", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", name
	 venv.pip_install_and_link buildpath
