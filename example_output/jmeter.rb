name :
	 Jmeter
homepage :
	 https://jmeter.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=jmeter/binaries/apache-jmeter-5.0.tgz
description :
	 Load testing and performance measurement application
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 prefix.install_metafiles
	 libexec.install Dir["*"]
	 bin.write_exec_script libexec/"bin/jmeter"
	 if build.with? "plugins"
	 resource("jmeterplugins-standard").stage do
	 rm_f Dir["lib/ext/*.bat"]
	 (libexec/"lib/ext").install Dir["lib/ext/*"]
	 (libexec/"licenses/plugins/standard").install "LICENSE", "README"
