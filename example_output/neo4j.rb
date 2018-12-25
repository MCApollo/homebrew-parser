name :
	 Neo4j
homepage :
	 https://neo4j.com/
url :
	 https://neo4j.com/artifact.php\?name\=neo4j-community-3.5.0-unix.tar.gz
description :
	 Robust (fully ACID) transactional property graph database
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
	 ENV["NEO4J_HOME"] = libexec
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/bin/neo4j{,-shell,-import,-shared.sh,-admin}", "#{libexec}/bin/cypher-shell"]
	 bin.env_script_all_files(libexec/"bin", :NEO4J_HOME => ENV["NEO4J_HOME"])
	 (libexec/"conf/neo4j.conf").append_lines <<~EOS
	 wrapper.java.additional=-Djava.awt.headless=true
	 wrapper.java.additional.4=-Dneo4j.ext.udc.source=homebrew
	 EOS
	 (var/"log").mkpath
