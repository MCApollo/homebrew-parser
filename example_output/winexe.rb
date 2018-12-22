name :
	 Winexe
homepage :
	 https://sourceforge.net/projects/winexe/
url :
	 https://downloads.sourceforge.net/project/winexe/winexe-1.00.tar.gz
description :
	 Remote Windows-command executor
build_deps :
	 autoconf
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
	 diff -Naur winexe-1.00-orig/source4/winexe/winexe.h winexe-1.00/source4/winexe/winexe.h
	 --- winexe-1.00-orig/source4/winexe/winexe.h    2011-06-18 00:00:00.000000000 +0000
	 +++ winexe-1.00/source4/winexe/winexe.h 2011-06-18 00:00:00.000000000 +0000
	 @@ -63,7 +63,7 @@
	 int async_write(struct async_context *c, const void *buf, int len);
	 int async_close(struct async_context *c);
	 -struct tevent_context *ev_ctx;
	 +extern struct tevent_context *ev_ctx;
	 /* winexesvc32_exe.c */
	 extern unsigned int winexesvc32_exe_len;
install :
	 if MacOS.version >= :mavericks
	 ENV.prepend_create_path "PERL5LIB", libexec+"lib/perl5"
	 resource("Perl4::CoreLibs").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
	 end
	 end
	 cd "source4" do
	 system "./autogen.sh"
	 system "./configure", "--enable-fhs"
	 system "make", "basics", "idl", "bin/winexe"
	 bin.install "bin/winexe"
	 end
