name :
	 Sops
homepage :
	 https://github.com/mozilla/sops
url :
	 https://github.com/mozilla/sops/archive/3.2.0.tar.gz
description :
	 Editor of encrypted files
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
	 ENV["GOBIN"] = bin
	 (buildpath/"src/go.mozilla.org").mkpath
	 ln_s buildpath, "src/go.mozilla.org/sops"
	 system "make", "install"
