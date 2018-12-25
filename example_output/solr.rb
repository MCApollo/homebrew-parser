name :
	 Solr
homepage :
	 https://lucene.apache.org/solr/
url :
	 https://www.apache.org/dyn/closer.cgi?path=lucene/solr/7.6.0/solr-7.6.0.tgz
description :
	 Enterprise search platform from the Apache Lucene project
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install %w[bin/solr bin/post bin/oom_solr.sh]
	 pkgshare.install "bin/solr.in.sh"
	 prefix.install %w[example server]
	 libexec.install Dir["*"]
	 inreplace "#{bin}/post", '"$SOLR_TIP/dist"', "#{libexec}/dist"
	 Dir.glob(["#{prefix}/example/**/solrconfig.xml",
	 "#{prefix}/**/data_driven_schema_configs/**/solrconfig.xml",
	 "#{prefix}/**/sample_techproducts_configs/**/solrconfig.xml"]) do |f|
	 inreplace f, ":../../../..}/", "}/libexec/"
	 end
