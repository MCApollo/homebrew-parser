name :
	 LtcTools
homepage :
	 https://github.com/x42/ltc-tools
url :
	 https://github.com/x42/ltc-tools/archive/v0.6.4.tar.gz
description :
	 Tools to deal with linear-timecode (LTC)
build_deps :
	 help2man
	 pkg-config
link_deps :
	 jack
	 libltc
	 libsndfile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
