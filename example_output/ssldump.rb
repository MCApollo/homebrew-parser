name :
	 Ssldump
homepage :
	 https://ssldump.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ssldump/ssldump/0.9b3/ssldump-0.9b3.tar.gz
description :
	 SSLv3/TLS network protocol analyzer
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
	 --- a/base/pcap-snoop.c	2010-03-18 22:59:13.000000000 -0700
	 +++ b/base/pcap-snoop.c	2010-03-18 22:59:30.000000000 -0700
	 @@ -46,10 +46,9 @@
	 static char *RCSSTRING="$Id: pcap-snoop.c,v 1.14 2002/09/09 21:02:58 ekr Exp $";
	 -
	 +#include <net/bpf.h>
	 #include <pcap.h>
	 #include <unistd.h>
	 -#include <net/bpf.h>
	 #ifndef _WIN32
	 #include <sys/param.h>
	 #endif
	 --- a/base/pcap-snoop.c	2012-04-06 10:35:06.000000000 -0700
	 +++ b/base/pcap-snoop.c	2012-04-06 10:45:31.000000000 -0700
	 @@ -286,7 +286,7 @@
	 err_exit("Aborting",-1);
	 }
	 }
	 -      if(!(p=pcap_open_live(interface_name,5000,!no_promiscuous,1000,errbuf))){
	 +      if(!(p=pcap_open_live(interface_name,18432,!no_promiscuous,1000,errbuf))){
	 fprintf(stderr,"PCAP: %s\n",errbuf);
	 err_exit("Aborting",-1);
	 }
install :
	 ENV["LIBS"] = "-lssl -lcrypto"
	 inreplace "configure", "if test -f $dir/libpcap.a; then",
	 "if test -f $dir/libpcap.dylib; then"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "osx"
	 system "make"
	 system "make", "install", "-B"
