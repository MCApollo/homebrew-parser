name :
	 Proguard
homepage :
	 https://proguard.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/proguard/proguard/6.0/proguard6.0.3.tar.gz
description :
	 Java class file shrinker, optimizer, and obfuscator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "lib/proguard.jar"
	 libexec.install "lib/proguardgui.jar"
	 bin.write_jar_script libexec/"proguard.jar", "proguard"
	 bin.write_jar_script libexec/"proguardgui.jar", "proguardgui"
