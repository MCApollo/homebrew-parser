name :
	 ApacheDrill
homepage :
	 https://drill.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=drill/drill-1.14.0/apache-drill-1.14.0.tar.gz
description :
	 Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage
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
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
