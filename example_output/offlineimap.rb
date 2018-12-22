name :
	 Offlineimap
homepage :
	 https://www.offlineimap.org/
url :
	 https://github.com/OfflineIMAP/offlineimap/archive/v7.2.1.tar.gz
description :
	 Synchronizes emails between two repositories
build_deps :
	 asciidoc
	 docbook-xsl
	 sphinx-doc
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "make", "docs"
	 man1.install "docs/offlineimap.1"
	 man7.install "docs/offlineimapui.7"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
	 resource("six").stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 etc.install "offlineimap.conf", "offlineimap.conf.minimal"
	 libexec.install "bin/offlineimap" => "offlineimap.py"
	 libexec.install "offlineimap"
	 (bin/"offlineimap").write_env_script(libexec/"offlineimap.py",
	 :PYTHONPATH => ENV["PYTHONPATH"])
