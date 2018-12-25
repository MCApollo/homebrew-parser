name :
	 Todolist
homepage :
	 http://todolist.site
url :
	 https://github.com/gammons/todolist/archive/v0.8.1.tar.gz
description :
	 Very fast, simple task manager for the command-line, based upon GTD
build_deps :
	 go
	 govendor
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
	 (buildpath/"src/github.com/gammons/").mkpath
	 ln_s buildpath, buildpath/"src/github.com/gammons/todolist"
	 system "go", "build", "-o", bin/"todolist", "./src/github.com/gammons/todolist"
