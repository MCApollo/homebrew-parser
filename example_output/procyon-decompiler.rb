name :
	 ProcyonDecompiler
homepage :
	 https://bitbucket.org/mstrobel/procyon/wiki/Java%20Decompiler
url :
	 https://bitbucket.org/mstrobel/procyon/downloads/procyon-decompiler-0.5.30.jar
description :
	 Modern decompiler for Java 5 and beyond
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "procyon-decompiler-#{version}.jar"
	 bin.write_jar_script libexec/"procyon-decompiler-#{version}.jar", "procyon-decompiler"
