name :
	 Fsql
homepage :
	 https://github.com/kshvmdn/fsql
url :
	 https://github.com/kshvmdn/fsql/archive/v0.3.1.tar.gz
description :
	 Search through your filesystem with SQL-esque queries
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/kshvmdn").mkpath
	 ln_s buildpath, buildpath/"src/github.com/kshvmdn/fsql"
	 system "go", "build", "-o", bin/"fsql", "github.com/kshvmdn/fsql/cmd/fsql"
