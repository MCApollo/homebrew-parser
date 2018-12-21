name :
	 Voms
homepage :
	 https://github.com/italiangrid/voms
url :
	 https://github.com/italiangrid/voms-clients/archive/v3.0.7.tar.gz
description :
	 Virtual organization membership service
build_deps :
	 maven
link_deps :
	 :java
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "mvn", "package", "-Dmaven.repo.local=$(pwd)/m2repo/", "-Dmaven.javadoc.skip=true"
	 system "tar", "-xf", "target/voms-clients.tar.gz"
	 share.install "voms-clients/share/java"
	 man5.install Dir["voms-clients/share/man/man5/*.5"]
	 man1.install Dir["voms-clients/share/man/man1/*.1"]
	 bin.install Dir["voms-clients/bin/*"]
