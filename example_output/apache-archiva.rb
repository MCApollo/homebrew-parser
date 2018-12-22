name :
	 ApacheArchiva
homepage :
	 https://archiva.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=archiva/2.2.3/binaries/apache-archiva-2.2.3-bin.tar.gz
description :
	 The Build Artifact Repository Manager
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/archiva"
	 (var/"archiva/logs").mkpath
	 (var/"archiva/data").mkpath
	 (var/"archiva/temp").mkpath
	 cp_r libexec/"conf", var/"archiva"
