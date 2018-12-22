name :
	 Docbook
homepage :
	 https://docbook.org/
url :
	 https://docbook.org/xml/5.0/docbook-5.0.zip
description :
	 Standard SGML representation system for technical documents
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (etc/"xml").mkpath
	 %w[42 412 43 44 45 50].each do |version|
	 resource("xml#{version}").stage do |r|
	 if version == "412"
	 cp prefix/"docbook/xml/4.2/catalog.xml", "catalog.xml"
	 inreplace "catalog.xml" do |s|
	 s.gsub! "V4.2 ..", "V4.1.2 "
	 s.gsub! "4.2", "4.1.2"
	 end
	 end
	 rm_rf "docs"
	 (prefix/"docbook/xml"/r.version).install Dir["*"]
	 end
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 unless File.file?("#{etc}/xml/catalog")
	 system "xmlcatalog", "--noout", "--create", "#{etc}/xml/catalog"
