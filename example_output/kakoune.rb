name :
	 Kakoune
homepage :
	 https://github.com/mawww/kakoune
url :
	 https://github.com/mawww/kakoune/releases/download/v2018.10.27/kakoune-2018.10.27.tar.bz2
description :
	 Selection-based modal text editor
build_deps :
	 asciidoc
	 docbook-xsl
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 cd "src" do
	 system "make", "install", "debug=no", "PREFIX=#{prefix}"
	 end
