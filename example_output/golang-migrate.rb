name :
	 GolangMigrate
homepage :
	 https://github.com/golang-migrate/migrate
url :
	 https://github.com/golang-migrate/migrate/archive/v4.1.0.tar.gz
description :
	 Database migrations CLI tool
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/golang-migrate/migrate").install buildpath.children
	 cd "src/github.com/golang-migrate/migrate" do
	 system "make", "build-cli", "VERSION=v#{version}"
	 bin.install "cli/build/migrate.darwin-amd64" => "migrate"
	 prefix.install_metafiles
	 end
