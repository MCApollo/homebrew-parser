name :
	 SqliteAnalyzer
homepage :
	 https://www.sqlite.org/
url :
	 https://sqlite.org/2018/sqlite-src-3260000.zip
description :
	 Analyze how space is allocated inside an SQLite file
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
	 sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 system "./configure", "--disable-debug",
	 "--with-tcl=#{sdkprefix}/System/Library/Frameworks/Tcl.framework/",
	 "--prefix=#{prefix}"
	 system "make", "sqlite3_analyzer"
	 bin.install "sqlite3_analyzer"
