name :
	 SeleniumServerStandalone
homepage :
	 https://www.seleniumhq.org/
url :
	 https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
description :
	 Browser automation for testing purposes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "selenium-server-standalone-#{version}.jar"
	 bin.write_jar_script libexec/"selenium-server-standalone-#{version}.jar", "selenium-server"
