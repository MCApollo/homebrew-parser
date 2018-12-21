name :
	 Snownews
homepage :
	 https://github.com/kouya/snownews
url :
	 https://github.com/kouya/snownews/archive/v1.5.13.tar.gz
description :
	 Text mode RSS newsreader
build_deps :
link_deps :
	 gettext
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
