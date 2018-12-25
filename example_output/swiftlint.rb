name :
	 Swiftlint
homepage :
	 https://github.com/realm/SwiftLint
url :
	 https://github.com/realm/SwiftLint.git
description :
	 Tool to enforce Swift style and conventions
build_deps :
link_deps :
	 :xcode
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SwiftLint.dst"
