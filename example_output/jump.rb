name :
	 Jump
homepage :
	 https://github.com/gsamokovarov/jump
url :
	 https://github.com/gsamokovarov/jump/archive/v0.22.0.tar.gz
description :
	 Helps you navigate your file system faster by learning your habits
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
	 (buildpath/"src/github.com/gsamokovarov").mkpath
	 ln_s buildpath, buildpath/"src/github.com/gsamokovarov/jump"
	 ENV["GO111MODULE"] = "off"
	 system "go", "build", "-o", "#{bin}/jump"
	 man1.install "man/jump.1"
	 man1.install "man/j.1"
