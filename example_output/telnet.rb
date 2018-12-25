name :
	 Telnet
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/remote_cmds/remote_cmds-60.tar.gz
description :
	 User interface to the TELNET protocol (built from macOS Sierra sources)
build_deps :
	 :xcode
link_deps :
optional_deps :
conflicts :
	 inetutils
resource :
	 ['libtelnet']
	 ['https://opensource.apple.com/tarballs/libtelnet/libtelnet-13.tar.gz']
patches :
EOF_patch :
install :
	 resource("libtelnet").stage do
	 ENV["SDKROOT"] = MacOS.sdk_path
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 xcodebuild "SYMROOT=build", "-arch", "x86_64"
	 libtelnet_dst = buildpath/"telnet.tproj/build/Products"
	 libtelnet_dst.install "build/Release/libtelnet.a"
	 libtelnet_dst.install "build/Release/usr/local/include/libtelnet/"
	 end
	 system "make", "-C", "telnet.tproj",
	 "OBJROOT=build/Intermediates",
	 "SYMROOT=build/Products",
	 "DSTROOT=build/Archive",
	 "CFLAGS=$(CC_Flags) -isystembuild/Products/",
	 "LDFLAGS=$(LD_Flags) -Lbuild/Products/",
	 "RC_ARCHS=x86_64",
	 "install"
	 bin.install "telnet.tproj/build/Archive/usr/local/bin/telnet"
	 man1.install "telnet.tproj/telnet.1"
