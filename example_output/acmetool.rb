name :
	 Acmetool
homepage :
	 https://github.com/hlandau/acme
url :
	 https://github.com/hlandau/acme.git
description :
	 Automatic certificate acquisition tool for ACME (Let's Encrypt)
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/hlandau").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/hlandau/acme"
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "cmd/acmetool" do
	 ldflags = %W[
	 -X github.com/hlandau/acme/storage.RecommendedPath=#{var}/lib/acmetool
	 -X github.com/hlandau/acme/hooks.DefaultPath=#{lib}/hooks
	 -X github.com/hlandau/acme/responder.StandardWebrootPath=#{var}/run/acmetool/acme-challenge
	 #{Utils.popen_read("#{buildpath}/src/github.com/hlandau/buildinfo/gen")}
	 ]
	 system "go", "build", "-o", bin/"acmetool", "-ldflags", ldflags.join(" ")
	 (var/"lib/acmetool").mkpath
	 (var/"run/acmetool").mkpath
