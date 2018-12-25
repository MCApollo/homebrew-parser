name :
	 CfrDecompiler
homepage :
	 https://www.benf.org/other/cfr/
url :
	 https://www.benf.org/other/cfr/cfr_0_132.jar
description :
	 Yet Another Java Decompiler
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
	 jar_version = version.to_s.tr(".", "_")
	 libexec.install "cfr_#{jar_version}.jar"
	 bin.write_jar_script libexec/"cfr_#{jar_version}.jar", "cfr-decompiler"
