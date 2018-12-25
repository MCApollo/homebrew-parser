name :
	 JoobyBootstrap
homepage :
	 https://github.com/jooby-project/jooby-bootstrap
url :
	 https://github.com/jooby-project/jooby-bootstrap/archive/0.2.2.tar.gz
description :
	 Script to simplify the creation of jooby apps
build_deps :
link_deps :
	 :java
	 maven
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "jooby"
	 (bin/"jooby").write_env_script libexec/"jooby", Language::Java.java_home_env("1.8")
