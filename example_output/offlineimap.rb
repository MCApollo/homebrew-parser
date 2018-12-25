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
optional_deps :
conflicts :
resource :
	 ['six']
	 ['https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
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
