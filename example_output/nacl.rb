name :
	 Nacl
homepage :
	 https://nacl.cr.yp.to/
url :
	 https://hyperelliptic.org/nacl/nacl-20110221.tar.bz2
description :
	 Network communication, encryption, decryption, signatures library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "do" do |s|
	 s.gsub! 'exec >"$top/log"', 'exec | tee "$top/log"'
	 s.gsub! /^shorthostname=`.*$/, "shorthostname=brew"
