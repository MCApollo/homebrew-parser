name :
	 AmdatuBootstrap
homepage :
	 https://www.amdatu.com/bootstrap/intro.html
url :
	 https://bitbucket.org/amdatuadm/amdatu-bootstrap/downloads/bootstrap-bin-r9.zip
description :
	 Bootstrapping OSGi development
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
	 libexec.install %w[amdatu-bootstrap bootstrap.jar conf]
	 (bin/"amdatu-bootstrap").write_env_script libexec/"amdatu-bootstrap",
	 Language::Java.java_home_env("1.8")
