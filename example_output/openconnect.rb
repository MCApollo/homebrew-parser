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
	 oath-toolkit
	 stoken
conflicts :
patches :
EOF_patch :
install :
	 etc.install resource("vpnc-script")
	 chmod 0755, "#{etc}/vpnc-script"
	 if build.head?
	 ENV["LIBTOOLIZE"] = "glibtoolize"
	 system "./autogen.sh"
