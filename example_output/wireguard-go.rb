name :
	 WireguardGo
homepage :
	 https://www.wireguard.com/
url :
	 https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-0.0.20181018.tar.xz
description :
	 Userspace Go implementation of WireGuard
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 system "make", "PREFIX=#{prefix}", "install"
