name :
	 Hashcat
homepage :
	 https://hashcat.net/hashcat/
url :
	 https://hashcat.net/files/hashcat-4.2.1.tar.gz
description :
	 World's fastest and most advanced password recovery utility
build_deps :
	 gnu-sed
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
	 system "make", "install", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
