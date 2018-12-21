name :
	 DcosCli
homepage :
	 https://dcos.io/docs/latest/cli/
url :
	 https://github.com/dcos/dcos-cli/archive/0.6.3.tar.gz
description :
	 Cross-platform command-line utility to manage DC/OS clusters
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 venv.pip_install [buildpath, buildpath/"cli"]
	 bin.install_symlink libexec/"bin/dcos"
