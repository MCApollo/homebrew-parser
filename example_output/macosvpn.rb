name :
	 Macosvpn
homepage :
	 https://github.com/halo/macosvpn
url :
	 https://github.com/halo/macosvpn/archive/0.3.5.tar.gz
description :
	 Create Mac OS VPNs programmatically
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 xcodebuild "SYMROOT=build"
	 bin.install "build/Release/macosvpn"
