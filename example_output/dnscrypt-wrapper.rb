name :
	 DnscryptWrapper
homepage :
	 https://cofyc.github.io/dnscrypt-wrapper/
url :
	 https://github.com/cofyc/dnscrypt-wrapper/archive/v0.4.2.tar.gz
description :
	 Server-side proxy that adds dnscrypt support to name resolvers
build_deps :
	 autoconf
link_deps :
	 libevent
	 libsodium
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "configure"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
