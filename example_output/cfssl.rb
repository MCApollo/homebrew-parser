name :
	 Cfssl
homepage :
	 https://cfssl.org/
url :
	 https://github.com/cloudflare/cfssl/archive/1.3.2.tar.gz
description :
	 CloudFlare's PKI toolkit
build_deps :
	 go
link_deps :
	 libtool
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 cfsslpath = buildpath/"src/github.com/cloudflare/cfssl"
	 cfsslpath.install Dir["{*,.git}"]
	 cd "src/github.com/cloudflare/cfssl" do
	 system "go", "build", "-o", "#{bin}/cfssl", "cmd/cfssl/cfssl.go"
	 system "go", "build", "-o", "#{bin}/cfssljson", "cmd/cfssljson/cfssljson.go"
	 system "go", "build", "-o", "#{bin}/cfsslmkbundle", "cmd/mkbundle/mkbundle.go"
	 end
