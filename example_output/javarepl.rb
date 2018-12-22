name :
	 Javarepl
homepage :
	 https://github.com/albertlatacz/java-repl
url :
	 https://github.com/albertlatacz/java-repl/releases/download/428/javarepl-428.jar
description :
	 Read Eval Print Loop (REPL) for Java
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "javarepl-#{version}.jar"
	 (libexec/"bin").write_jar_script libexec/"javarepl-#{version}.jar", "javarepl"
	 (libexec/"bin/javarepl").chmod 0755
	 (bin/"javarepl").write_env_script libexec/"bin/javarepl", Language::Java.java_home_env("1.8")
