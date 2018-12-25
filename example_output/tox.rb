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
optional_deps :
conflicts :
resource :
	 ['filelock', 'packaging', 'pluggy', 'py', 'pyparsing', 'six', 'toml', 'virtualenv']
	 ['https://files.pythonhosted.org/packages/2a/bd/6a87635dba4906ae56377b22f64805b2f00d8cafb26e411caaf3559a5475/filelock-3.0.10.tar.gz', 'https://files.pythonhosted.org/packages/cf/50/1f10d2626df0aa97ce6b62cf6ebe14f605f4e101234f7748b8da4138a8ed/packaging-18.0.tar.gz', 'https://files.pythonhosted.org/packages/65/25/81d0de17cd00f8ca994a4e74e3c4baf7cd25072c0b831dad5c7d9d6138f8/pluggy-0.8.0.tar.gz', 'https://files.pythonhosted.org/packages/c7/fa/eb6dd513d9eb13436e110aaeef9a1703437a8efa466ce6bb2ff1d9217ac7/py-1.7.0.tar.gz', 'https://files.pythonhosted.org/packages/d0/09/3e6a5eeb6e04467b737d55f8bba15247ac0876f98fae659e58cd744430c6/pyparsing-2.3.0.tar.gz', 'https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz', 'https://files.pythonhosted.org/packages/b9/19/5cbd78eac8b1783671c40e34bb0fa83133a06d340a38b55c645076d40094/toml-0.10.0.tar.gz', 'https://files.pythonhosted.org/packages/4e/8b/75469c270ac544265f0020aa7c4ea925c5284b23e445cf3aa8b99f662690/virtualenv-16.1.0.tar.gz']
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
