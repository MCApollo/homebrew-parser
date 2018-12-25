name :
	 Wsk
homepage :
	 https://openwhisk.apache.org/
url :
	 https://github.com/apache/incubator-openwhisk-cli/archive/0.9.0-incubating.tar.gz
description :
	 OpenWhisk Command-Line Interface (CLI)
build_deps :
	 go
	 go-bindata
	 govendor
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/apache/incubator-openwhisk-cli/pull/362.patch?full_index=1
	 https://github.com/apache/incubator-openwhisk-cli/pull/363.patch?full_index=1
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/apache/incubator-openwhisk-cli"
	 dir.install buildpath.children
	 cd dir do
	 system "go-bindata", "-pkg", "wski18n", "-o",
	 "wski18n/i18n_resources.go", "wski18n/resources"
	 system "govendor", "sync"
	 system "go", "build", "-o", bin/"wsk"
	 prefix.install_metafiles
	 end
