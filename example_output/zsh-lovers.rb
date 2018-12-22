name :
	 ZshLovers
homepage :
	 https://grml.org/zsh/#zshlovers
url :
	 https://deb.grml.org/pool/main/z/zsh-lovers/zsh-lovers_0.9.1_all.deb
description :
	 Tips, tricks, and examples for zsh
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "tar", "xf", "zsh-lovers_#{version}_all.deb"
	 system "tar", "xf", "data.tar.xz"
	 system "gunzip", *Dir["usr/**/*.gz"]
	 prefix.install_metafiles "usr/share/doc/zsh-lovers"
	 prefix.install "usr/share"
