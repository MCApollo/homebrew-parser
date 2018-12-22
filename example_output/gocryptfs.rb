name :
	 Gocryptfs
homepage :
	 https://nuetzlich.net/gocryptfs/
url :
	 https://github.com/rfjakob/gocryptfs/releases/download/v1.6.1/gocryptfs_v1.6.1_src-deps.tar.gz
description :
	 Encrypted overlay filesystem written in Go
build_deps :
	 go
	 pkg-config
link_deps :
	 openssl
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/rfjakob/gocryptfs").install buildpath.children
	 cd "src/github.com/rfjakob/gocryptfs" do
	 system "./build.bash"
	 bin.install "gocryptfs"
	 prefix.install_metafiles
	 end
