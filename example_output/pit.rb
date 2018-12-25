name :
	 Pit
homepage :
	 https://github.com/michaeldv/pit
url :
description :
	 Project manager from hell (integrates with Git)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/michaeldv/pit/commit/e378582f4d04760d1195675ab034aac5d7908d8d.diff?full_index=1
	 https://github.com/michaeldv/pit/commit/5d81148349cc442d81cc98779a4678f03f59df67.diff?full_index=1
EOF_patch :
install :
	 bin.mkpath
	 system "make"
	 system "make", "test"
	 system "make", "install", "PREFIX=#{prefix}"
