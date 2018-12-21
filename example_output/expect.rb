name :
	 Expect
homepage :
	 https://expect.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/expect/Expect/5.45.4/expect5.45.4.tar.gz
description :
	 Program that can automate interactive applications
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 tcl-tk
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --exec-prefix=#{prefix}
	 --mandir=#{man}
	 --enable-shared
	 ]
	 args << "--enable-threads" if build.with? "threads"
	 args << "--enable-64bit" if MacOS.prefer_64_bit?
	 if build.with? "brewed-tk"
	 args << "--with-tcl=#{Formula["tcl-tk"].opt_prefix}/lib"
	 else
	 ENV.prepend "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework/Versions/8.5/Headers/tcl-private"
	 args << "--with-tcl=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework"
