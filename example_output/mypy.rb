name :
	 Mypy
homepage :
	 http://www.mypy-lang.org/
url :
	 https://github.com/python/mypy.git
description :
	 Experimental optional static type checker for Python
build_deps :
	 sphinx-doc
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['psutil', 'sphinx_rtd_theme', 'typed-ast']
	 ['https://files.pythonhosted.org/packages/51/9e/0f8f5423ce28c9109807024f7bdde776ed0b1161de20b408875de7e030c3/psutil-5.4.6.tar.gz', 'https://files.pythonhosted.org/packages/1c/f2/a1361e5f399e0b4182d031065eececa63ddb8c19a0616b03f119c4d5b6b4/sphinx_rtd_theme-0.4.0.tar.gz', 'https://files.pythonhosted.org/packages/52/cf/2ebc7d282f026e21eed4987e42e10964a077c13cfc168b42f3573a7f178c/typed-ast-1.1.0.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 version_static = buildpath/"mypy/version_static.py"
	 version_static.write "__version__ = '#{version}'\n"
	 inreplace "docs/source/conf.py", "mypy.version", "mypy.version_static"
	 (buildpath/"docs/sphinx_rtd_theme").install resource("sphinx_rtd_theme")
	 inreplace "docs/source/conf.py",
	 "sys.path.insert(0, os.path.abspath('../..'))",
	 "sys.path[:0] = [os.path.abspath('../..'), os.path.abspath('../sphinx_rtd_theme')]"
	 system "make", "-C", "docs", "html"
	 doc.install Dir["docs/build/html/*"]
	 rm version_static
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
