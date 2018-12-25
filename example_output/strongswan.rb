name :
	 Strongswan
homepage :
	 https://www.strongswan.org
url :
	 https://download.strongswan.org/strongswan-5.7.1.tar.bz2
description :
	 VPN based on IPsec
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --sbindir=#{bin}
	 --sysconfdir=#{etc}
	 --disable-defaults
	 --enable-charon
	 --enable-cmd
	 --enable-constraints
	 --enable-curve25519
	 --enable-eap-gtc
	 --enable-eap-identity
	 --enable-eap-md5
	 --enable-eap-mschapv2
	 --enable-ikev1
	 --enable-ikev2
	 --enable-kernel-pfkey
	 --enable-kernel-pfroute
	 --enable-nonce
	 --enable-openssl
	 --enable-osx-attr
	 --enable-pem
	 --enable-pgp
	 --enable-pkcs1
	 --enable-pkcs8
	 --enable-pki
	 --enable-pubkey
	 --enable-revocation
	 --enable-scepclient
	 --enable-socket-default
	 --enable-sshkey
	 --enable-stroke
	 --enable-swanctl
	 --enable-unity
	 --enable-updown
	 --enable-x509
	 --enable-xauth-generic
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "check"
	 system "make", "install"
