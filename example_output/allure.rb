name :
	 Allure
homepage :
	 https://github.com/allure-framework/allure2
url :
	 https://dl.bintray.com/qameta/maven/io/qameta/allure/allure-commandline/2.8.1/allure-commandline-2.8.1.zip
description :
	 Flexible lightweight test report tool
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 prefix.install_metafiles
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
