name :
	 JettyRunner
homepage :
	 https://www.eclipse.org/jetty/
url :
	 https://search.maven.org/remotecontent?filepath=org/eclipse/jetty/jetty-runner/9.4.12.v20180830/jetty-runner-9.4.12.v20180830.jar
description :
	 Use Jetty without an installed distribution
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
	 libexec.install Dir["*"]
	 bin.mkpath
	 bin.write_jar_script libexec/"jetty-runner-#{version}.jar", "jetty-runner"
