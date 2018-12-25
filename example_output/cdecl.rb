name :
	 Cdecl
homepage :
	 https://cdecl.org/
url :
	 https://cdecl.org/files/cdecl-blocks-2.5.tar.gz
description :
	 Turn English phrases to C or C++ declarations
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
	 inreplace "cdecl.c", "getline", "cdecl_getline"
	 bin.mkpath
	 man1.mkpath
	 ENV.append "CFLAGS", "-DBSD -DUSE_READLINE -std=gnu89"
	 system "make", "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LIBS=-lreadline",
	 "BINDIR=#{bin}",
	 "MANDIR=#{man1}",
	 "install"
