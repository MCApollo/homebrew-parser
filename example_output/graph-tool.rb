name :
	 GraphTool
homepage :
	 https://graph-tool.skewed.de/
url :
	 https://downloads.skewed.de/graph-tool/graph-tool-2.27.tar.bz2
description :
	 Efficient network analysis for Python 3
build_deps :
	 pkg-config
link_deps :
	 boost
	 boost-python3
	 cairomm
	 cgal
	 google-sparsehash
	 gtk+3
	 librsvg
	 :macos
	 numpy
	 py3cairo
	 pygobject3
	 python
	 scipy
optional_deps :
conflicts :
resource :
	 ['Cycler', 'kiwisolver', 'matplotlib', 'pyparsing', 'python-dateutil', 'pytz', 'six']
	 ['https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz', 'https://files.pythonhosted.org/packages/31/60/494fcce70d60a598c32ee00e71542e52e27c978e5f8219fae0d4ac6e2864/kiwisolver-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/ec/ed/46b835da53b7ed05bd4c6cae293f13ec26e877d2e490a53a709915a9dcb7/matplotlib-2.2.2.tar.gz', 'https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz', 'https://files.pythonhosted.org/packages/10/76/52efda4ef98e7544321fd8d5d512e11739c1df18b0649551aeccfb1c8376/pytz-2018.4.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
	 https://git.skewed.de/count0/graph-tool/commit/0407f41a.diff
	 https://git.skewed.de/count0/graph-tool/commit/aa39e4a6.diff
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :high_sierra
	 xy = Language::Python.major_minor_version "python3"
	 venv = virtualenv_create(libexec, "python3")
	 resources.each do |r|
	 venv.pip_install_and_link r
	 end
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 PYTHON=python3
	 PYTHON_LIBS=-undefined\ dynamic_lookup
	 --with-python-module-path=#{lib}/python#{xy}/site-packages
	 --with-boost-python=boost_python#{xy.to_s.delete(".")}-mt
	 ]
	 args << "--with-expat=#{MacOS.sdk_path}/usr" if MacOS.sdk_path_if_needed
	 system "./configure", *args
	 system "make", "install"
	 site_packages = "lib/python#{xy}/site-packages"
	 pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
	 (prefix/site_packages/"homebrew-graph-tool.pth").write pth_contents
