name :
	 Embulk
homepage :
	 https://www.embulk.org/
url :
	 https://bintray.com/artifact/download/embulk/maven/embulk-0.9.11.jar
description :
	 Data transfer between various databases, file formats and services
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
	 libexec.install "embulk-#{version}.jar" => "embulk.jar"
	 (bin/"embulk").write <<~EOS
	 #!/bin/bash
	 export JAVA_HOME=$(#{Language::Java.java_home_cmd("1.8")})
	 exec /bin/bash "#{libexec}/embulk.jar" "$@"
	 EOS
