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
conflicts :
patches :
EOF_patch :
install :
	 data = var/"artifactory"
	 data.mkpath
	 libexec.install_symlink data => "data"
