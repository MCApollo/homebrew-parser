name :
	 ApacheBrooklynCli
homepage :
	 https://brooklyn.apache.org
url :
	 https://github.com/apache/brooklyn-client/archive/rel/apache-brooklyn-0.12.0.tar.gz
description :
	 Apache Brooklyn command-line interface
build_deps :
	 glide
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XC_OS"] = "darwin"
	 ENV["XC_ARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = bin
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 (buildpath/"src/github.com/apache/brooklyn-client").install "cli"
	 cd "src/github.com/apache/brooklyn-client/cli" do
	 system "glide", "install"
	 system "go", "install", ".../br"
	 prefix.install_metafiles
	 end
