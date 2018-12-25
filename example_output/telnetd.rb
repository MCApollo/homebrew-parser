name :
	 Telnetd
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/remote_cmds/remote_cmds-54.50.1.tar.gz
description :
	 TELNET server (built from macOS Sierra sources)
build_deps :
	 :xcode
link_deps :
optional_deps :
conflicts :
resource :
	 ['libtelnet']
	 ['https://opensource.apple.com/tarballs/libtelnet/libtelnet-13.tar.gz']
patches :
EOF_patch :
install :
	 resource("libtelnet").stage do
	 xcodebuild "SYMROOT=build", "-arch", "x86_64"
	 libtelnet_dst = buildpath/"telnetd.tproj/build/Products"
	 libtelnet_dst.install "build/Release/libtelnet.a"
	 libtelnet_dst.install "build/Release/usr/local/include/libtelnet/"
	 end
	 system "make", "-C", "telnetd.tproj",
	 "OBJROOT=build/Intermediates",
	 "SYMROOT=build/Products",
	 "DSTROOT=build/Archive",
	 "CC=#{ENV.cc}",
	 "CFLAGS=$(CC_Flags) -isystembuild/Products/",
	 "LDFLAGS=$(LD_Flags) -Lbuild/Products/",
	 "RC_ARCHS=x86_64"
	 sbin.install "telnetd.tproj/build/Products/telnetd"
	 man8.install "telnetd.tproj/telnetd.8"
