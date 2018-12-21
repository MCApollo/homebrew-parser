name :
	 Gptsync
homepage :
	 https://refit.sourceforge.io/
url :
	 https://downloads.sourceforge.net/refit/refit-src-0.14.tar.gz
description :
	 GPT and MBR partition tables synchronization tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "gptsync" do
	 system "make", "-f", "Makefile.unix", "CC=#{ENV.cc}"
	 sbin.install "gptsync", "showpart"
	 man8.install "gptsync.8"
