name :
	 Htmlcleaner
homepage :
	 https://htmlcleaner.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/htmlcleaner/htmlcleaner/htmlcleaner%20v2.21/htmlcleaner-2.21-src.zip
description :
	 HTML parser written in Java
build_deps :
	 maven
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 system "mvn", "--log-file", "build-output.log", "clean", "package"
	 libexec.install Dir["target/htmlcleaner-*.jar"]
	 (bin/"htmlcleaner").write <<~EOS
	 #!/bin/bash
	 export JAVA_HOME=$(#{cmd})
	 exec java  -jar #{libexec}/htmlcleaner-#{version}.jar "$@"
	 EOS
