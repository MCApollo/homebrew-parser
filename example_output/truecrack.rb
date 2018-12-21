name :
	 Truecrack
homepage :
	 https://github.com/lvaccaro/truecrack
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/truecrack/truecrack_v35.tar.gz
description :
	 Brute-force password cracker for TrueCrypt
build_deps :
link_deps :
conflicts :
patches :
	 https://gist.githubusercontent.com/anonymous/b912a1ede06eb1e8eb38/raw/1394a8a6bedb7caae8ee034f512f76a99fe55976/truecrack-return-value-fix.patch
EOF_patch :
install :
	 system "./configure", "--enable-cpu",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--datarootdir=#{pkgshare}",
	 "--mandir=#{man}"
	 system "make", "install"
