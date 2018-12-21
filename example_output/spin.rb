name :
	 Spin
homepage :
	 https://spinroot.com/spin/whatispin.html
url :
	 https://spinroot.com/spin/Src/spin648.tar.gz
description :
	 The efficient verification tool of multi-threaded software
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cd "Src#{version}" do
	 system "make"
	 bin.install "spin"
