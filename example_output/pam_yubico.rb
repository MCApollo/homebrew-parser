name :
	 PamYubico
homepage :
	 https://developers.yubico.com/yubico-pam/
url :
	 https://developers.yubico.com/yubico-pam/Releases/pam_yubico-2.26.tar.gz
description :
	 Yubico pluggable authentication module
build_deps :
	 pkg-config
link_deps :
	 libyubikey
	 ykclient
	 ykpers
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-libyubikey-prefix=#{Formula["libyubikey"].opt_prefix}",
	 "--with-libykclient-prefix=#{Formula["ykclient"].opt_prefix}"
	 system "make", "install"
