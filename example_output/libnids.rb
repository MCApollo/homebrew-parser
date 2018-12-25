name :
	 Libnids
homepage :
	 https://libnids.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/libnids/libnids/1.24/libnids-1.24.tar.gz
description :
	 Implements E-component of network intrusion detection system
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 glib
	 libnet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- a/src/Makefile.in	2010-03-01 13:13:17.000000000 -0800
	 +++ b/src/Makefile.in	2012-09-19 09:48:23.000000000 -0700
	 @@ -13,7 +13,7 @@
	 libdir		= @libdir@
	 mandir		= @mandir@
	 LIBSTATIC      = libnids.a
	 -LIBSHARED      = libnids.so.1.24
	 +LIBSHARED      = libnids.1.24.dylib
	 CC		= @CC@
	 CFLAGS		= @CFLAGS@ -DLIBNET_VER=@LIBNET_VER@ -DHAVE_ICMPHDR=@ICMPHEADER@ -DHAVE_TCP_STATES=@TCPSTATES@ -DHAVE_BSD_UDPHDR=@HAVE_BSD_UDPHDR@
	 @@ -65,7 +65,7 @@
	 ar -cr $@ $(OBJS)
	 $(RANLIB) $@
	 $(LIBSHARED): $(OBJS_SHARED)
	 -	$(CC) -shared -Wl,-soname,$(LIBSHARED) -o $(LIBSHARED) $(OBJS_SHARED) $(LIBS) $(LNETLIB) $(PCAPLIB)
	 +	$(CC) -dynamiclib -Wl,-dylib -Wl,-install_name,$(LIBSHARED) -Wl,-headerpad_max_install_names -o $(LIBSHARED) $(OBJS_SHARED) $(LIBS) $(LNETLIB) $(PCAPLIB)
	 _install install: $(LIBSTATIC)
	 ../mkinstalldirs $(install_prefix)$(libdir)
	 @@ -76,7 +76,7 @@
	 $(INSTALL) -c -m 644 libnids.3 $(install_prefix)$(mandir)/man3
	 _installshared installshared: install $(LIBSHARED)
	 $(INSTALL) -c -m 755 $(LIBSHARED) $(install_prefix)$(libdir)
	 -	ln -s -f $(LIBSHARED) $(install_prefix)$(libdir)/libnids.so
	 +	ln -s -f $(LIBSHARED) $(install_prefix)$(libdir)/libnids.dylib
	 clean:
	 rm -f *.o *~ $(LIBSTATIC) $(LIBSHARED)
install :
	 system "autoreconf", "-ivf"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}",
	 "--enable-shared"
	 system "make", "install"
