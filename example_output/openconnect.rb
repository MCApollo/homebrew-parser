name :
	 Openconnect
homepage :
	 https://www.infradead.org/openconnect/
url :
	 http://ftp.infradead.org/pub/openconnect/openconnect-7.08.tar.gz
description :
	 Open client for Cisco AnyConnect VPN
build_deps :
	 pkg-config
link_deps :
	 gettext
	 gnutls
optional_deps :
	 oath-toolkit
	 stoken
conflicts :
resource :
	 ['vpnc-script']
	 ['http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/6e04e0bbb66c0bf0ae055c0f4e58bea81dbb5c3c:/vpnc-script']
patches :
EOF_patch :
install :
	 etc.install resource("vpnc-script")
	 chmod 0755, "#{etc}/vpnc-script"
	 if build.head?
	 ENV["LIBTOOLIZE"] = "glibtoolize"
	 system "./autogen.sh"
	 end
	 args = %W[
	 --prefix=#{prefix}
	 --sbindir=#{bin}
	 --localstatedir=#{var}
	 --with-vpnc-script=#{etc}/vpnc-script
	 ]
	 system "./configure", *args
	 system "make", "install"
