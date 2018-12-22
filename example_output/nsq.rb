name :
	 Nsq
homepage :
	 https://nsq.io/
url :
	 https://github.com/nsqio/nsq/archive/v1.1.0.tar.gz
description :
	 Realtime distributed messaging platform
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/nsqio/nsq").install buildpath.children
	 cd "src/github.com/nsqio/nsq" do
	 system "dep", "ensure", "--vendor-only"
	 system "make", "DESTDIR=#{prefix}", "PREFIX=", "install"
	 prefix.install_metafiles
	 end
	 (var/"log").mkpath
	 (var/"nsq").mkpath
