name :
	 YouGet
homepage :
	 https://you-get.org/
url :
	 https://github.com/soimort/you-get/archive/v0.4.1181.tar.gz
description :
	 Dumb downloader that scrapes the web
build_deps :
link_deps :
	 python
optional_deps :
	 rtmpdump
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
