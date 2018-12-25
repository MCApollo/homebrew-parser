name :
	 WrkTrello
homepage :
	 https://github.com/blangel/wrk
url :
	 https://github.s3.amazonaws.com/downloads/blangel/wrk/wrk-1.0.1.tar.gz
description :
	 Command-line interface to Trello
build_deps :
link_deps :
optional_deps :
conflicts :
	 wrk
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"wrk").write script
