name :
	 Jena
homepage :
	 https://jena.apache.org/
url :
	 https://archive.apache.org/dist/jena/binaries/apache-jena-3.9.0.tar.gz
description :
	 Framework for building semantic web and linked data apps
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf "bat"
	 prefix.install %w[LICENSE NOTICE README]
	 libexec.install Dir["*"]
	 Dir.glob("#{libexec}/bin/*") do |path|
	 bin_name = File.basename(path)
	 (bin/bin_name).write shim_script(bin_name)
	 end
