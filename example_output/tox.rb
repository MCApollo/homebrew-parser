name :
	 Tox
homepage :
	 https://tox.readthedocs.org/
url :
	 https://files.pythonhosted.org/packages/1a/4a/e8e8b54a904aefdff5cf6a08117e543ff5ff0f49c84c14861bd2869c89d7/tox-3.6.0.tar.gz
description :
	 Generic Python virtualenv management and test command-line tool
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 lib_python_path = Pathname.glob(libexec/"lib/python*").first
	 lib_python_path.each_child do |f|
	 next unless f.symlink?
	 realpath = f.realpath
	 rm f
	 ln_s realpath, f
	 end
	 inreplace lib_python_path/"orig-prefix.txt",
	 Formula["python"].opt_prefix, Formula["python"].prefix.realpath
