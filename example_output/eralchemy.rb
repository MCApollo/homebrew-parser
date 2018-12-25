name :
	 Eralchemy
homepage :
	 https://github.com/Alexis-benoist/eralchemy
url :
	 https://files.pythonhosted.org/packages/87/40/07b58c29406ad9cc8747e567e3e37dd74c0a8756130ad8fd3a4d71c796e3/ERAlchemy-1.2.10.tar.gz
description :
	 Simple entity relation (ER) diagrams generation
build_deps :
	 pkg-config
link_deps :
	 graphviz
	 openssl
	 python
optional_deps :
conflicts :
resource :
	 ['pygraphviz', 'SQLAlchemy', 'er_example']
	 ['https://files.pythonhosted.org/packages/98/bb/a32e33f7665b921c926209305dde66fe41003a4ad934b10efb7c1211a419/pygraphviz-1.3.1.tar.gz', 'https://files.pythonhosted.org/packages/f3/b7/d8725042f105cc6b71c7bae0ffd46e49f762e5a08f421f1eddd855a1f723/SQLAlchemy-1.2.4.tar.gz', 'https://raw.githubusercontent.com/Alexis-benoist/eralchemy/v1.1.0/example/newsmeme.er']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 res = resources.map(&:name).to_set - ["er_example"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
