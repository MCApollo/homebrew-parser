name :
	 Safe
homepage :
	 https://github.com/starkandwayne/safe
url :
	 https://github.com/starkandwayne/safe/archive/v0.9.9.tar.gz
description :
	 Command-line interface for Vault
build_deps :
	 go
link_deps :
	 vault
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["VERSION"] = version
	 (buildpath/"src/github.com/starkandwayne/safe").install buildpath.children
	 cd "src/github.com/starkandwayne/safe" do
	 system "make", "build"
	 bin.install "safe"
	 prefix.install_metafiles
	 end
