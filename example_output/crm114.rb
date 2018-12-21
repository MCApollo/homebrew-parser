name :
	 Crm114
homepage :
	 https://crm114.sourceforge.io/
url :
	 https://crm114.sourceforge.io/tarballs/crm114-20100106-BlameMichelson.src.tar.gz
description :
	 Examine, sort, filter or alter logs or data streams
build_deps :
link_deps :
	 tre
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-std=gnu89"
	 inreplace "Makefile", "LDFLAGS += -static -static-libgcc", ""
	 bin.mkpath
	 system "make", "prefix=#{prefix}", "install"
