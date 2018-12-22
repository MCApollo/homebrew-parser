name :
	 Distcc
homepage :
	 https://github.com/distcc/distcc/
url :
	 https://github.com/distcc/distcc/releases/download/v3.3.2/distcc-3.3.2.tar.gz
description :
	 Distributed compiler client and server
build_deps :
	 autoconf
	 automake
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 buildpath.install resource("libiberty")
	 cd "libiberty" do
	 system "./configure"
	 system "make"
	 end
	 ENV.append "LDFLAGS", "-L#{buildpath}/libiberty"
	 ENV.append_to_cflags "-I#{buildpath}/include"
	 inreplace "Makefile.in", '--root="$$DESTDIR"', ""
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
