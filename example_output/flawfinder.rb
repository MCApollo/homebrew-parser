name :
	 Flawfinder
homepage :
	 https://www.dwheeler.com/flawfinder/
url :
	 https://www.dwheeler.com/flawfinder/flawfinder-2.0.6.tar.gz
description :
	 Examines code and reports possible security weaknesses
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "install"
