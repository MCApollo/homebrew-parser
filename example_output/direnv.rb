name :
	 Direnv
homepage :
	 https://direnv.net/
url :
	 https://github.com/direnv/direnv/archive/v2.18.2.tar.gz
description :
	 Load/unload environment variables based on $PWD
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/direnv/direnv").install buildpath.children
	 cd "src/github.com/direnv/direnv" do
	 system "make", "install", "DESTDIR=#{prefix}"
	 prefix.install_metafiles
	 end
