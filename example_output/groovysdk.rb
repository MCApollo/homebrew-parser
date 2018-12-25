name :
	 Groovysdk
homepage :
	 http://www.groovy-lang.org
url :
	 https://dl.bintray.com/groovy/maven/apache-groovy-sdk-2.5.4.zip
description :
	 SDK for Groovy: a Java-based scripting language
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
	 groovy
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GROOVY_HOME"] = libexec
	 rm_f Dir["bin/*.bat"]
	 prefix.install_metafiles
	 bin.install Dir["bin/*"]
	 libexec.install "conf", "lib", "src", "doc"
	 bin.env_script_all_files(libexec+"bin", :GROOVY_HOME => ENV["GROOVY_HOME"])
