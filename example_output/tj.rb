name :
	 Tj
homepage :
	 https://github.com/sgreben/tj
url :
	 https://github.com/sgreben/tj/archive/7.0.0.tar.gz
description :
	 Line timestamping tool
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
	 (buildpath/"src/github.com/sgreben/tj").install buildpath.children
	 cd "src/github.com/sgreben/tj" do
	 system "make", "binaries/osx_x86_64/tj"
	 bin.install "binaries/osx_x86_64/tj"
	 prefix.install_metafiles
	 end
