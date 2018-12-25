name :
	 Ethereum
homepage :
	 https://ethereum.github.io/go-ethereum/
url :
	 https://github.com/ethereum/go-ethereum/archive/v1.8.20.tar.gz
description :
	 Official Go implementation of the Ethereum protocol
build_deps :
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
	 system "make", "all"
	 bin.install Dir["build/bin/*"]
