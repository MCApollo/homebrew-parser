name :
	 Etcd
homepage :
	 https://github.com/etcd-io/etcd
url :
	 https://github.com/etcd-io/etcd/releases/download/v3.3.10/v3.3.10.tar.gz
description :
	 Key value store for shared configuration and service discovery
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
	 ENV["GOPATH"] = buildpath
	 mkdir_p "src/github.com/etcd-io"
	 ln_s buildpath, "src/github.com/etcd-io/etcd"
	 system "./build"
	 bin.install "bin/etcd"
	 bin.install "bin/etcdctl"
