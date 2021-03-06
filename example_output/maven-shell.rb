name :
	 MavenShell
homepage :
	 https://github.com/jdillon/mvnsh
url :
	 https://search.maven.org/remotecontent?filepath=org/sonatype/maven/shell/dist/mvnsh-assembly/1.1.0/mvnsh-assembly-1.1.0-bin.tar.gz
description :
	 Shell for Maven
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
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/mvnsh"
