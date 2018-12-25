name :
	 Gomplate
homepage :
	 https://gomplate.hairyhenderson.ca/
url :
	 https://github.com/hairyhenderson/gomplate/archive/v2.8.0.tar.gz
description :
	 Command-line Golang template processor
build_deps :
	 go
	 upx
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/hairyhenderson/gomplate").install buildpath.children
	 cd "src/github.com/hairyhenderson/gomplate" do
	 system "make", "compress", "VERSION=#{version}"
	 bin.install "bin/gomplate-slim" => "gomplate"
	 prefix.install_metafiles
	 end
