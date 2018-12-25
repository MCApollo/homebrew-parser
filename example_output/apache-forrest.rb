name :
	 ApacheForrest
homepage :
	 https://forrest.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=forrest/apache-forrest-0.9-sources.tar.gz
description :
	 Publishing framework providing multiple output formats
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['deps']
	 ['https://www.apache.org/dyn/closer.cgi?path=forrest/apache-forrest-0.9-dependencies.tar.gz']
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"forrest").write_env_script libexec/"bin/forrest", Language::Java.java_home_env
	 resource("deps").stage do
	 deps_to_install = [
	 "lib",
	 "main/webapp/resources/schema/relaxng",
	 "main/webapp/resources/stylesheets",
	 "plugins/org.apache.forrest.plugin.output.pdf/",
	 "tools/ant",
	 "tools/forrestbot/lib",
	 "tools/forrestbot/webapp/lib",
	 "tools/jetty",
	 ]
	 deps_to_install.each do |dep|
	 (libexec+dep).install Dir["#{dep}/*"]
	 end
	 end
