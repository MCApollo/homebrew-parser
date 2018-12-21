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
	 graphviz
	 pygtksourceview
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resource("pyxdg").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
