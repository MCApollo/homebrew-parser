name :
	 PreCommit
homepage :
	 https://pre-commit.com/
url :
	 https://github.com/pre-commit/pre-commit/archive/v1.12.0.tar.gz
description :
	 Framework for managing multi-language pre-commit hooks
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", "PyYAML==3.13b1", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "pre-commit"
	 venv.pip_install_and_link buildpath
	 lib_python_path = Pathname.glob(libexec/"lib/python*").first
	 lib_python_path.each_child do |f|
	 next unless f.symlink?
	 realpath = f.realpath
	 rm f
	 ln_s realpath, f
