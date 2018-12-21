name :
	 Groovyserv
homepage :
	 https://kobo.github.io/groovyserv/
url :
	 https://bitbucket.org/kobo/groovyserv-mirror/downloads/groovyserv-1.2.0-src.zip
description :
	 Speed up Groovy startup time
build_deps :
	 go
link_deps :
	 groovy
	 :java
conflicts :
patches :
EOF_patch :
install :
	 ENV["GRADLE_USER_HOME"] = buildpath/".brew_home"
	 system "./gradlew", "clean", "distLocalBin"
	 system "unzip", "build/distributions/groovyserv-#{version}-bin-local.zip"
	 libexec.install Dir["groovyserv-#{version}/{bin,lib}"]
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
