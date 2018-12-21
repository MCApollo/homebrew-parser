name :
	 GtkDoc
homepage :
	 https://www.gtk.org/gtk-doc/
url :
	 https://download.gnome.org/sources/gtk-doc/1.28/gtk-doc-1.28.tar.xz
description :
	 GTK+ documentation tool
build_deps :
	 itstool
	 pkg-config
link_deps :
	 docbook
	 docbook-xsl
	 gettext
	 libxml2
	 python@2
	 source-highlight
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resource("six").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
