name :
	 Skopeo
homepage :
	 https://github.com/containers/skopeo
url :
	 https://github.com/containers/skopeo/archive/v0.1.32.tar.gz
description :
	 Work with remote images registries
build_deps :
	 go
link_deps :
	 gpgme
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/containers/skopeo").install buildpath.children
	 cd "src/github.com/containers/skopeo" do
	 system "make", "binary-local"
	 bin.install "skopeo"
	 prefix.install_metafiles
	 end
