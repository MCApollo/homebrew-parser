name :
	 Jython
homepage :
	 http://www.jython.org
url :
	 https://search.maven.org/remotecontent?filepath=org/python/jython-installer/2.7.1/jython-installer-2.7.1.jar
description :
	 Python implementation written in Java (successor to JPython)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "java", "-jar", cached_download, "-s", "-d", libexec
	 bin.install_symlink libexec/"bin/jython"
