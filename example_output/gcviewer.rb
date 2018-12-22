name :
	 Gcviewer
homepage :
	 https://github.com/chewiebug/GCViewer
url :
	 https://downloads.sourceforge.net/project/gcviewer/gcviewer-1.35.jar
description :
	 Java garbage collection visualization tool
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec/"gcviewer-#{version}.jar", "gcviewer"
