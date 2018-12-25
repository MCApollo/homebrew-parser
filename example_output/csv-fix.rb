name :
	 CsvFix
homepage :
	 https://neilb.bitbucket.io/csvfix/
url :
	 https://bitbucket.org/neilb/csvfix/get/version-1.6.tar.gz
description :
	 Tool for manipulating CSV data
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
	 ENV.libcxx
	 system "make", "lin"
	 bin.install "csvfix/bin/csvfix"
