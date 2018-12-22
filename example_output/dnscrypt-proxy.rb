name :
	 DnscryptProxy
homepage :
	 https://github.com/jedisct1/dnscrypt-proxy
url :
	 https://github.com/jedisct1/dnscrypt-proxy/archive/2.0.19.tar.gz
description :
	 Secure communications between a client and a DNS resolver
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 prefix.install_metafiles
	 dir = buildpath/"src/github.com/jedisct1/dnscrypt-proxy"
	 dir.install buildpath.children
	 cd dir/"dnscrypt-proxy" do
	 system "go", "build", "-ldflags", "-X main.version=#{version}", "-o",
	 sbin/"dnscrypt-proxy"
	 pkgshare.install Dir["example*"]
	 etc.install pkgshare/"example-dnscrypt-proxy.toml" => "dnscrypt-proxy.toml"
	 end
