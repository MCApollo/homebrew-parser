name :
	 Ford
homepage :
	 https://github.com/cmacmackin/ford/
url :
	 https://github.com/cmacmackin/ford/archive/v6.0.0.tar.gz
description :
	 Automatic documentation generator for modern Fortran programs
build_deps :
link_deps :
	 graphviz
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 venv.pip_install_and_link buildpath
	 doc.install "2008standard.pdf", "2003standard.pdf"
	 pkgshare.install "example-project-file.md"
