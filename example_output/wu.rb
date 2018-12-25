name :
	 Wu
homepage :
	 https://github.com/sramsay/wu
url :
	 https://github.com/sramsay/wu/archive/3.10.0.tar.gz
description :
	 CLI that retrieves weather data from Weather Underground
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
	 mkdir_p buildpath/"src/github.com/sramsay"
	 ln_sf buildpath, buildpath/"src/github.com/sramsay/wu"
	 cd "src/github.com/sramsay/wu" do
	 system "go", "build", "-o", bin/"wu", "-ldflags", "-X main.Version=#{version}"
	 end
