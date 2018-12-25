name :
	 SpringLoaded
homepage :
	 https://github.com/spring-projects/spring-loaded
url :
	 https://repo.spring.io/simple/libs-release-local/org/springframework/springloaded/1.2.6.RELEASE/springloaded-1.2.6.RELEASE.jar
description :
	 Java agent to enable class reloading in a running JVM
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 (share/"java").install "springloaded-#{version}.RELEASE.jar" => "springloaded.jar"
