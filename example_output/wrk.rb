name :
	 Wrk
homepage :
	 https://github.com/wg/wrk
url :
	 https://github.com/wg/wrk/archive/4.1.0.tar.gz
description :
	 HTTP benchmarking tool
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
	 wrk-trello
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 system "make"
	 bin.install "wrk"
