name :
	 Pipenv
homepage :
	 https://docs.pipenv.org/
url :
	 https://files.pythonhosted.org/packages/fd/e9/01822318551caa0d62a181ba3b10f0f3757bb1e270da97165bd52db92776/pipenv-2018.11.26.tar.gz
description :
	 Python dependency management tool
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['certifi', 'virtualenv', 'virtualenv-clone']
	 ['https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz', 'https://files.pythonhosted.org/packages/4e/8b/75469c270ac544265f0020aa7c4ea925c5284b23e445cf3aa8b99f662690/virtualenv-16.1.0.tar.gz', 'https://files.pythonhosted.org/packages/14/2f/84b6a8e380439cdfdb71e0ced2a805a66e343ac540d3304bde6bc28fbb46/virtualenv-clone-0.3.0.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 venv.pip_install buildpath
	 (libexec/"tools").install_symlink libexec/"bin/pewtwo", libexec/"bin/pip",
	 libexec/"bin/virtualenv"
	 env = {
	 :PATH => "#{libexec}/tools:$PATH",
	 }
	 (bin/"pipenv").write_env_script(libexec/"bin/pipenv", env)
	 output = Utils.popen_read("#{libexec}/bin/pipenv --completion")
	 (bash_completion/"pipenv").write output
	 lib_python_path = Pathname.glob(libexec/"lib/python*").first
	 lib_python_path.each_child do |f|
	 next unless f.symlink?
	 realpath = f.realpath
	 rm f
	 ln_s realpath, f
	 end
	 inreplace lib_python_path/"orig-prefix.txt",
	 Formula["python"].opt_prefix, Formula["python"].prefix.realpath
