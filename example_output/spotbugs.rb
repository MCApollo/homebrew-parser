name :
	 Spotbugs
homepage :
	 https://spotbugs.github.io/
url :
	 https://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/3.1.9/spotbugs-3.1.9.tgz
description :
	 Tool for Java static analysis (FindBugs's successor)
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "gradle", "build"
	 system "gradle", "installDist"
	 libexec.install Dir["spotbugs/build/install/spotbugs/*"]
	 else
	 libexec.install Dir["*"]
