name :
	 SpringRoo
homepage :
	 https://projects.spring.io/spring-roo/
url :
	 https://s3.amazonaws.com/spring-roo-repository.springsource.org/release/ROO/spring-roo-2.0.0.RELEASE.zip
description :
	 Rapid application development tool for Java developers
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 mv "#{libexec}/bin/roo.sh", "#{libexec}/bin/roo"
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
