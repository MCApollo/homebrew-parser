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
optional_deps :
conflicts :
resource :
	 ['beautifulsoup4', 'graphviz', 'Jinja2', 'lxml', 'Markdown', 'markdown-include', 'MarkupSafe', 'md-environ', 'Pygments', 'toposort', 'tqdm']
	 ['https://files.pythonhosted.org/packages/fa/8d/1d14391fdaed5abada4e0f63543fef49b8331a34ca60c88bd521bcf7f782/beautifulsoup4-4.6.0.tar.gz', 'https://files.pythonhosted.org/packages/21/e8/13b0523da93d7189d9ab30097cdd2ffe78f88b0cc69f341749dec562b731/graphviz-0.8.4.zip', 'https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz', 'https://files.pythonhosted.org/packages/54/a6/43be8cf1cc23e3fa208cab04ba2f9c3b7af0233aab32af6b5089122b44cd/lxml-4.2.3.tar.gz', 'https://files.pythonhosted.org/packages/b3/73/fc5c850f44af5889192dff783b7b0d8f3fe8d30b65c8e3f78f8f0265fecf/Markdown-2.6.11.tar.gz', 'https://files.pythonhosted.org/packages/ef/44/eb6e9b4fa1110b719abb876c9b6dd8b46af886a94536ec4e9117fe5e7b97/markdown-include-0.5.1.tar.gz', 'https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz', 'https://files.pythonhosted.org/packages/68/a9/86666edbf0d3929d5b3be3347c153881139aa1e28af38f6496edcc034003/md-environ-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/e5/d8/9bc1598ddf74410beba243ffeaee8d0b3ca7e9ac5cefe77367da497433e1/toposort-1.5.tar.gz', 'https://files.pythonhosted.org/packages/41/61/d36ff28878ca73bb3932dfa6bab36ff872e6dac18c9ace328879b1798279/tqdm-4.23.4.tar.gz']
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 venv.pip_install_and_link buildpath
	 doc.install "2008standard.pdf", "2003standard.pdf"
	 pkgshare.install "example-project-file.md"
