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
conflicts :
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
