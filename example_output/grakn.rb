name :
	 Grakn
homepage :
	 https://grakn.ai
url :
	 https://github.com/graknlabs/grakn/releases/download/v1.4.2/grakn-core-1.4.2.zip
description :
	 The distributed hyper-relational database for knowledge engineering
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install libexec/"grakn", libexec/"graql"
	 bin.env_script_all_files(libexec, Language::Java.java_home_env("1.8"))
