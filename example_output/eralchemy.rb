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
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 res = resources.map(&:name).to_set - ["er_example"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
