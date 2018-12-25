name :
	 Mahout
homepage :
	 https://mahout.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=mahout/0.13.0/apache-mahout-distribution-0.13.0.tar.gz
description :
	 Library to help build scalable machine learning libraries
build_deps :
link_deps :
	 hadoop
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 chmod 755, "./bin"
	 system "mvn", "-DskipTests", "clean", "install"
	 end
	 libexec.install "bin"
	 if build.head?
	 libexec.install Dir["buildtools/target/*.jar"]
	 libexec.install Dir["core/target/*.jar"]
	 libexec.install Dir["examples/target/*.jar"]
	 libexec.install Dir["math/target/*.jar"]
	 else
	 libexec.install Dir["*.jar"]
	 end
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env)
