name :
	 Ipfs
homepage :
	 https://ipfs.io/
url :
	 https://github.com/ipfs/go-ipfs.git
description :
	 Peer-to-peer hypermedia protocol
build_deps :
	 go
	 godep
link_deps :
	 gx
	 gx-go
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/ipfs/go-ipfs").install buildpath.children
	 cd("src/github.com/ipfs/go-ipfs") { system "make", "install" }
	 bin.install "bin/ipfs"
