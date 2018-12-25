name :
	 Noti
homepage :
	 https://github.com/variadico/noti
url :
	 https://github.com/variadico/noti/archive/3.1.0.tar.gz
description :
	 Trigger notifications when a process completes
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
	 notipath = buildpath/"src/github.com/variadico/noti"
	 notipath.install Dir["*"]
	 cd "src/github.com/variadico/noti/cmd/noti" do
	 system "go", "build"
	 bin.install "noti"
	 prefix.install_metafiles
	 end
