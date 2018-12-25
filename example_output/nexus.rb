name :
	 Nexus
homepage :
	 https://www.sonatype.org/
url :
	 https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/oss/nexus-2.14.10-01-bundle.tar.gz
description :
	 Repository manager for binary software components
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
	 inreplace "nexus-#{version}/conf/nexus.properties",
	 "nexus-work=${bundleBasedir}/../sonatype-work/nexus",
	 "nexus-work=#{var}/nexus"
	 libexec.install Dir["nexus-#{version}/*"]
	 bin.install_symlink libexec/"bin/nexus"
