name :
	 Zim
homepage :
	 http://zim-wiki.org/
url :
	 https://github.com/jaap-karssenberg/zim-desktop-wiki/archive/0.69.tar.gz
description :
	 Graphical text editor used to maintain a collection of wiki pages
build_deps :
	 pkg-config
link_deps :
	 gtk+
	 pygobject
	 pygtk
	 python@2
optional_deps :
	 graphviz
	 pygtksourceview
conflicts :
resource :
	 ['pyxdg']
	 ['https://files.pythonhosted.org/packages/source/p/pyxdg/pyxdg-0.25.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resource("pyxdg").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 ENV["XDG_DATA_DIRS"] = libexec/"share"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", "./setup.py", "install", "--prefix=#{libexec}", "--skip-xdg-cmd"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"], :XDG_DATA_DIRS => libexec/"share"
	 pkgshare.install "zim"
