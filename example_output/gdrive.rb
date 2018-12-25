name :
	 Gdrive
homepage :
	 https://github.com/prasmussen/gdrive
url :
	 https://github.com/prasmussen/gdrive/archive/2.1.0.tar.gz
description :
	 Google Drive CLI Client
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
	 mkdir_p buildpath/"src/github.com/prasmussen/"
	 ln_sf buildpath, buildpath/"src/github.com/prasmussen/gdrive"
	 system "go", "build", "-o", "gdrive", "."
	 bin.install "gdrive"
	 doc.install "README.md"
