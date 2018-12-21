name :
	 WireguardTools
homepage :
	 https://www.wireguard.com/
url :
	 https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181119.tar.xz
description :
	 Tools for the WireGuard secure network tunnel
build_deps :
link_deps :
	 bash
	 wireguard-go
conflicts :
patches :
EOF_patch :
install :
	 system "make", "BASHCOMPDIR=#{bash_completion}", "WITH_BASHCOMPLETION=yes", "WITH_WGQUICK=yes",
	 "WITH_SYSTEMDUNITS=no", "PREFIX=#{prefix}", "SYSCONFDIR=#{prefix}/etc",
	 "-C", "src/tools", "install"
