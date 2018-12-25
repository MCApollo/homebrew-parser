name :
	 Artifactory
homepage :
	 https://www.jfrog.com/artifactory/
url :
	 https://dl.bintray.com/jfrog/artifactory/jfrog-artifactory-oss-6.3.2.zip
description :
	 Manages binaries
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
	 rm_f Dir["bin/*.bat"]
	 rm_f Dir["bin/*.exe"]
	 inreplace "bin/artifactory.sh",
	 'export ARTIFACTORY_HOME="$(cd "$(dirname "${artBinDir}")" && pwd)"',
	 "export ARTIFACTORY_HOME=#{libexec}"
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/artifactory.sh"
	 bin.install_symlink libexec/"bin/artifactory.default"
	 data = var/"artifactory"
	 data.mkpath
	 libexec.install_symlink data => "data"
