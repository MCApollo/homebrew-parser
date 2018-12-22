name :
	 Smimesign
homepage :
	 https://github.com/github/smimesign
url :
	 https://github.com/github/smimesign/archive/0.0.10.tar.gz
description :
	 S/MIME signing utility for use with Git
build_deps :
	 go
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/github/smimesign").install buildpath.children
	 cd "src/github.com/github/smimesign" do
	 system "go", "build", "-o", bin/"smimesign", "-ldflags", "-X main.versionString=#{version}"
	 prefix.install_metafiles
	 end
