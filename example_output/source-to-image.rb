name :
	 SourceToImage
homepage :
	 https://github.com/openshift/source-to-image
url :
	 https://github.com/openshift/source-to-image.git
description :
	 Tool for building source and injecting into docker images
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "hack/common.sh", "go1.4", "go1.0"
	 system "hack/build-go.sh"
	 bin.install "_output/local/bin/darwin/amd64/s2i"
