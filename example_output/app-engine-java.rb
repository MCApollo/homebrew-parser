name :
	 AppEngineJava
homepage :
	 https://cloud.google.com/appengine/docs/java/
url :
	 https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.68.zip
description :
	 Google App Engine for Java
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
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 %w[appcfg.sh dev_appserver.sh endpoints.sh run_java.sh].each do |f|
	 bin.install libexec/"bin/#{f}"
	 end
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
