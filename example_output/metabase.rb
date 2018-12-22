name :
	 Metabase
homepage :
	 https://www.metabase.com/
url :
	 http://downloads.metabase.com/v0.30.4/metabase.jar
description :
	 Business intelligence report server
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "./bin/build"
	 libexec.install "target/uberjar/metabase.jar"
	 else
	 libexec.install "metabase.jar"
	 end
	 (bin/"metabase").write <<~EOS
	 #!/bin/bash
	 export JAVA_HOME="$(#{Language::Java.java_home_cmd("1.8")})"
	 exec java -jar "#{libexec}/metabase.jar" "$@"
	 EOS
