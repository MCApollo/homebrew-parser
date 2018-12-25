name :
	 Launch
homepage :
	 https://sabi.net/nriley/software/#launch
url :
	 https://sabi.net/nriley/software/launch-1.2.5.tar.gz
description :
	 Command-line launcher for macOS, in the spirit of `open`
build_deps :
	 :xcode
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf "launch"
	 xcodebuild "-configuration", "Deployment", "SYMROOT=build", "clean"
	 xcodebuild "-configuration", "Deployment", "SYMROOT=build"
	 man1.install gzip("launch.1")
	 bin.install "build/Deployment/launch"
