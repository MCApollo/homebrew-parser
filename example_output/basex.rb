name :
	 Basex
homepage :
	 http://basex.org
url :
	 http://files.basex.org/releases/9.1.1/BaseX911.zip
description :
	 Light-weight XML database and XPath/XQuery processor
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
	 rm Dir["bin/*.bat"]
	 rm_rf "repo"
	 rm_rf "data"
	 rm_rf "etc"
	 prefix.install_metafiles
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
