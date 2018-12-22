name :
	 Groovy
homepage :
	 http://www.groovy-lang.org
url :
	 https://dl.bintray.com/groovy/maven/apache-groovy-binary-2.5.4.zip
description :
	 Java-based scripting language
build_deps :
link_deps :
	 :java
conflicts :
	 groovysdk
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 if build.with? "invokedynamic"
	 Dir.glob("indy/*.jar") do |src_path|
	 dst_file = File.basename(src_path, "-indy.jar") + ".jar"
	 dst_path = File.join("lib", dst_file)
	 mv src_path, dst_path
	 end
