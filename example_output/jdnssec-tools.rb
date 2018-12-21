name :
	 JdnssecTools
homepage :
	 https://github.com/dblacka/jdnssec-tools
url :
	 https://github.com/dblacka/jdnssec-tools/releases/download/0.14/jdnssec-tools-0.14.tar.gz
description :
	 Java command-line tools for DNSSEC
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 inreplace Dir["bin/*"], /basedir=.*/, "basedir=#{libexec}"
	 bin.install Dir["bin/*"]
	 (libexec/"lib").install Dir["lib/*"]
