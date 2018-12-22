name :
	 Libhid
homepage :
	 https://directory.fsf.org/wiki/Libhid
url :
	 https://pkg.freebsd.org/ports-distfiles/libhid-0.2.16.tar.gz
description :
	 Library to access and interact with USB HID devices
build_deps :
link_deps :
	 libusb
	 libusb-compat
conflicts :
patches :
EOF_patch :
	 --- libhid-0.2.16/src/Makefile.am.org	2014-01-02 19:20:33.000000000 +0200
	 +++ libhid-0.2.16/src/Makefile.am	2014-01-02 19:21:15.000000000 +0200
	 @@ -17,7 +17,7 @@ else
	 if OS_DARWIN
	 OS_SUPPORT_SOURCE = darwin.c
	 AM_CFLAGS += -no-cpp-precomp
	 -AM_LDFLAGS += -lIOKit -framework "CoreFoundation"
	 +AM_LDFLAGS += -framework IOKit -framework "CoreFoundation"
	 else
	 OS_SUPPORT =
	 --- libhid-0.2.16/src/Makefile.in.org	2014-01-02 19:20:35.000000000 +0200
	 +++ libhid-0.2.16/src/Makefile.in	2014-01-02 19:21:24.000000000 +0200
	 @@ -39,7 +39,7 @@ POST_UNINSTALL = :
	 build_triplet = @build@
	 host_triplet = @host@
	 @OS_BSD_FALSE@@OS_DARWIN_TRUE@@OS_LINUX_FALSE@@OS_SOLARIS_FALSE@am__append_1 = -no-cpp-precomp
	 -@OS_BSD_FALSE@@OS_DARWIN_TRUE@@OS_LINUX_FALSE@@OS_SOLARIS_FALSE@am__append_2 = -lIOKit -framework "CoreFoundation"
	 +@OS_BSD_FALSE@@OS_DARWIN_TRUE@@OS_LINUX_FALSE@@OS_SOLARIS_FALSE@am__append_2 = -framework IOKit -framework "CoreFoundation"
	 bin_PROGRAMS = libhid-detach-device$(EXEEXT)
	 subdir = src
	 DIST_COMMON = $(include_HEADERS) $(srcdir)/Makefile.am \
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-swig"
	 system "make", "install"
