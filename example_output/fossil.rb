name :
	 Fossil
homepage :
	 https://www.fossil-scm.org/
url :
	 https://www.fossil-scm.org/index.html/uv/fossil-src-2.7.tar.gz
description :
	 Distributed software configuration management
build_deps :
link_deps :
	 openssl
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 args = [
	 "--with-tcl-private-stubs=1",
	 "--json",
	 ]
	 if MacOS.sdk_path_if_needed
	 args << "--with-tcl=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework"
	 else
	 args << "--with-tcl-stubs"
	 end
	 if build.with? "osxfuse"
	 ENV.prepend "CFLAGS", "-I/usr/local/include/osxfuse"
	 else
	 args << "--disable-fusefs"
	 end
	 system "./configure", *args
	 system "make"
	 bin.install "fossil"
