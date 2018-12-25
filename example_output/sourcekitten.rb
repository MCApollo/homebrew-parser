name :
	 Sourcekitten
homepage :
	 https://github.com/jpsim/SourceKitten
url :
	 https://github.com/jpsim/SourceKitten.git
description :
	 Framework and command-line tool for interacting with SourceKit
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
	 system "make", "prefix_install", "PREFIX=#{prefix}", "TEMPORARY_FOLDER=#{buildpath}/SourceKitten.dst"
