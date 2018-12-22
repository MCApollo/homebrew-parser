name :
	 Grails
homepage :
	 https://grails.org
url :
	 https://github.com/grails/grails-core/releases/download/v3.3.9/grails-3.3.9.zip
description :
	 Web application framework for the Groovy language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat", "bin/cygrails", "*.bat"]
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
