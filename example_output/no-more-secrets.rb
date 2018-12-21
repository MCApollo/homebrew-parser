name :
	 NoMoreSecrets
homepage :
	 https://github.com/bartobri/no-more-secrets
url :
	 https://github.com/bartobri/no-more-secrets/archive/v0.3.3.tar.gz
description :
	 Recreates the SETEC ASTRONOMY effect from 'Sneakers'
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all"
	 system "make", "prefix=#{prefix}", "install"
