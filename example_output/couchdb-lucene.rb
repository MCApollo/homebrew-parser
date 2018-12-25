name :
	 CouchdbLucene
homepage :
	 https://github.com/rnewson/couchdb-lucene
url :
	 https://github.com/rnewson/couchdb-lucene/archive/v2.1.0.tar.gz
description :
	 Full-text search of CouchDB documents using Lucene
build_deps :
	 maven
link_deps :
	 couchdb
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "mvn"
	 system "tar", "-xzf", "target/couchdb-lucene-#{version}-dist.tar.gz", "--strip", "1"
	 prefix.install_metafiles
	 rm_rf Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 Dir.glob("#{libexec}/bin/*") do |path|
	 bin_name = File.basename(path)
	 cmd = "cl_#{bin_name}"
	 (bin/cmd).write shim_script(bin_name)
	 (libexec/"clbin").install_symlink bin/cmd => bin_name
	 end
	 ini_path.write(ini_file) unless ini_path.exist?
