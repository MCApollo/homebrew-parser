name :
	 Openvpn
homepage :
	 https://openvpn.net/index.php/download/community-downloads.html
url :
	 https://swupdate.openvpn.org/community/releases/openvpn-2.4.6.tar.xz
description :
	 SSL/TLS VPN implementing OSI layer 2 or 3 secure network extension
build_deps :
	 pkg-config
link_deps :
	 lz4
	 lzo
	 :macos
	 openssl
optional_deps :
conflicts :
resource :
	 ['pkcs11-helper']
	 ['https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-1.22/pkcs11-helper-1.22.tar.bz2']
patches :
EOF_patch :
install :
	 vendor = buildpath/"brew_vendor"
	 resource("pkcs11-helper").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{vendor}/pkcs11-helper",
	 "--disable-threading",
	 "--disable-slotevent",
	 "--disable-shared"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", vendor/"pkcs11-helper/lib/pkgconfig"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-crypto-library=openssl",
	 "--enable-pkcs11",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 inreplace "sample/sample-config-files/openvpn-startup.sh",
	 "/etc/openvpn", "#{etc}/openvpn"
	 (doc/"samples").install Dir["sample/sample-*"]
	 (etc/"openvpn").install doc/"samples/sample-config-files/client.conf"
	 (etc/"openvpn").install doc/"samples/sample-config-files/server.conf"
	 rm doc/"README.mbedtls"
	 end
	 def post_install
	 (var/"run/openvpn").mkpath
	 end
	 plist_options :startup => true
	 def plist; <<~EOS
	 <?xml version="1.0" encoding="UTF-8"?>
	 <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd";>
	 <plist version="1.0">
	 <dict>
	 <key>Label</key>
	 <string>#{plist_name}</string>
	 <key>ProgramArguments</key>
	 <array>
	 <string>#{opt_sbin}/openvpn</string>
	 <string>--config</string>
	 <string>#{etc}/openvpn/openvpn.conf</string>
	 </array>
	 <key>OnDemand</key>
	 <false/>
	 <key>RunAtLoad</key>
	 <true/>
	 <key>TimeOut</key>
	 <integer>90</integer>
	 <key>WatchPaths</key>
	 <array>
	 <string>#{etc}/openvpn</string>
	 </array>
	 <key>WorkingDirectory</key>
	 <string>#{etc}/openvpn</string>
	 </dict>
	 </plist>
	 EOS
	 end
	 test do
	 system sbin/"openvpn", "--show-ciphers"
	 end
