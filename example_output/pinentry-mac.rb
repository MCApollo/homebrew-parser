name :
	 PinentryMac
homepage :
	 https://github.com/GPGTools/pinentry-mac
url :
	 https://github.com/GPGTools/pinentry-mac/archive/v0.9.4.tar.gz
description :
	 Pinentry for GPG on Mac
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
	 https://github.com/GPGTools/pinentry-mac/pull/7.patch?full_index=1
EOF_patch :
install :
	 system "make"
	 prefix.install "build/Release/pinentry-mac.app"
	 bin.write_exec_script "#{prefix}/pinentry-mac.app/Contents/MacOS/pinentry-mac"
