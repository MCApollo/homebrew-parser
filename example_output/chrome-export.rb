name :
	 ChromeExport
homepage :
	 https://github.com/bdesham/chrome-export
url :
	 https://github.com/bdesham/chrome-export/archive/v2.0.1.tar.gz
description :
	 Convert Chrome’s bookmarks and history to HTML bookmarks files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "export-chrome-bookmarks"
	 bin.install "export-chrome-history"
	 pkgshare.install "test"
