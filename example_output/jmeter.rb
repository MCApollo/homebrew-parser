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
	 end
	 resource("serveragent").stage do
	 rm_f Dir["*.bat"]
	 rm_f Dir["lib/*winnt*"]
	 rm_f Dir["lib/*solaris*"]
	 rm_f Dir["lib/*aix*"]
	 rm_f Dir["lib/*hpux*"]
	 rm_f Dir["lib/*linux*"]
	 rm_f Dir["lib/*freebsd*"]
	 (libexec/"serveragent").install Dir["*"]
	 end
	 resource("jmeterplugins-extras").stage do
	 (libexec/"lib/ext").install Dir["lib/ext/*.jar"]
	 (libexec/"licenses/plugins/extras").install "LICENSE", "README"
	 end
	 resource("jmeterplugins-extraslibs").stage do
	 (libexec/"lib/ext").install Dir["lib/ext/*.jar"]
	 (libexec/"lib").install Dir["lib/*.jar"]
	 (libexec/"licenses/plugins/extras").install "LICENSE", "README"
	 end
	 resource("jmeterplugins-webdriver").stage do
	 (libexec/"lib/ext").install Dir["lib/ext/*.jar"]
	 (libexec/"lib").install Dir["lib/*.jar"]
	 (libexec/"licenses/plugins/extras").install "LICENSE", "README"
	 end
	 resource("jmeterplugins-hadoop").stage do
	 (libexec/"lib/ext").install Dir["lib/ext/*.jar"]
	 (libexec/"lib").install Dir["lib/*.jar"]
	 (libexec/"licenses/plugins/extras").install "LICENSE", "README", "NOTICE"
	 end