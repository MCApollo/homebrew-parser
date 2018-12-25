name :
	 Flyway
homepage :
	 https://flywaydb.org/
url :
	 https://search.maven.org/remotecontent?filepath=org/flywaydb/flyway-commandline/5.2.4/flyway-commandline-5.2.4.tar.gz
description :
	 Database version control to control migrations
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
	 rm Dir["*.cmd"]
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/flyway"]
