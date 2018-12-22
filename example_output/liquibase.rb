name :
	 Liquibase
homepage :
	 https://www.liquibase.org/
url :
	 https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.6.2/liquibase-3.6.2-bin.tar.gz
description :
	 Library for database change tracking
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["*.bat"]
	 chmod 0755, "liquibase"
	 prefix.install_metafiles
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"liquibase"
	 (libexec/"lib").install_symlink Dir["#{libexec}/sdk/lib-sdk/slf4j*"]
