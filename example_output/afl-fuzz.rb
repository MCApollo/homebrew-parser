name :
	 AflFuzz
homepage :
	 http://lcamtuf.coredump.cx/afl/
url :
	 http://lcamtuf.coredump.cx/afl/releases/afl-2.52b.tgz
description :
	 American fuzzy lop: Security-oriented fuzzer
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
