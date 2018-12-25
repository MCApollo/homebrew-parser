name :
	 Crash
homepage :
	 https://www.crashub.org/
url :
	 https://search.maven.org/remotecontent?filepath=org/crashub/crash.distrib/1.3.2/crash.distrib-1.3.2.tar.gz
description :
	 Kernel debugging shell for Java that allows gdb-like syntax
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['docs']
	 ['https://search.maven.org/remotecontent?filepath=org/crashub/crash.distrib/1.3.2/crash.distrib-1.3.2-docs.tar.gz']
patches :
EOF_patch :
install :
	 doc.install resource("docs")
	 libexec.install Dir["crash/*"]
	 bin.install_symlink "#{libexec}/bin/crash.sh"
