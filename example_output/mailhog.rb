name :
	 Mailhog
homepage :
	 https://github.com/mailhog/MailHog
url :
	 https://github.com/gorilla/mux.git
description :
	 Web and API based SMTP testing tool
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = bin
	 path = buildpath/"src/github.com/mailhog/MailHog"
	 path.install buildpath.children
	 Language::Go.stage_deps resources, buildpath/"src" if build.stable?
	 cd path do
	 system "go", "install", "-v", ".../MailHog"
	 prefix.install_metafiles
