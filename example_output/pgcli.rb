name :
	 Pgcli
homepage :
	 https://pgcli.com/
url :
	 https://files.pythonhosted.org/packages/29/fd/f4a8e2ffa43e0729af52ba5232bc84e5b4f01520d44a8238deeba2ca3885/pgcli-2.0.1.tar.gz
description :
	 CLI for Postgres with auto-completion and syntax highlighting
build_deps :
link_deps :
	 libpq
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
