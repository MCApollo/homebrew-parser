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
conflicts :
patches :
EOF_patch :
install :
	 resource("libtelnet").stage do
	 xcodebuild "SYMROOT=build", "-arch", "x86_64"
	 libtelnet_dst = buildpath/"telnetd.tproj/build/Products"
	 libtelnet_dst.install "build/Release/libtelnet.a"
	 libtelnet_dst.install "build/Release/usr/local/include/libtelnet/"
