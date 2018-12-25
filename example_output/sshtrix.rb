name :
	 Sshtrix
homepage :
	 http://www.nullsecurity.net/tools/cracker.html
url :
	 https://github.com/nullsecuritynet/tools/raw/master/cracker/sshtrix/release/sshtrix-0.0.2.tar.gz
description :
	 SSH login cracker
build_deps :
link_deps :
	 libssh
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile", "-lssh_threads", ""
	 bin.mkpath
	 system "make", "sshtrix", "CC=#{ENV.cc}"
	 system "make", "DISTDIR=#{prefix}", "install"
