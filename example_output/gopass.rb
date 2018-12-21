name :
	 Gopass
homepage :
	 https://www.justwatch.com/gopass
url :
	 https://github.com/gopasspw/gopass/releases/download/v1.8.3/gopass-1.8.3.tar.gz
description :
	 The slightly more awesome Standard Unix Password Manager for Teams
build_deps :
	 go
link_deps :
	 gnupg
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/gopasspw/gopass").install buildpath.children
	 cd "src/github.com/gopasspw/gopass" do
	 prefix.install_metafiles
	 ENV["PREFIX"] = prefix
	 system "make", "install"
