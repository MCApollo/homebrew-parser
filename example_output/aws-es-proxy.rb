name :
	 AwsEsProxy
homepage :
	 https://github.com/abutaha/aws-es-proxy
url :
	 https://github.com/abutaha/aws-es-proxy/archive/v0.9.tar.gz
description :
	 Small proxy between HTTP client and AWS Elasticsearch
build_deps :
	 glide
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GLIDE_HOME"] = buildpath/"glide_home"
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/abutaha/aws-es-proxy").install buildpath.children
	 cd "src/github.com/abutaha/aws-es-proxy" do
	 system "glide", "install"
	 system "go", "build", "-o", "aws-es-proxy"
	 bin.install "aws-es-proxy"
	 prefix.install_metafiles
	 end
