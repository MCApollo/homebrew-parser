name :
	 Ucloud
homepage :
	 https://www.ucloud.cn
url :
	 https://github.com/ucloud/ucloud-cli/archive/0.1.6.tar.gz
description :
	 The official tool to managment your ucloud services
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/ucloud/ucloud-cli"
	 dir.install buildpath.children
	 cd dir do
	 system "go", "build", "-o", bin/"ucloud"
	 prefix.install_metafiles
	 end
