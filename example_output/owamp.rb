name :
	 Owamp
homepage :
	 https://www.internet2.edu/products-services/performance-analytics/performance-tools/
url :
	 https://software.internet2.edu/sources/owamp/owamp-3.4-10.tar.gz
description :
	 Implementation of the One-Way Active Measurement Protocol
build_deps :
link_deps :
	 i2util
conflicts :
patches :
EOF_patch :
	 diff -ur owamp-3.4/owamp/endpoint.c owamp-3.4.fixed/owamp/endpoint.c
	 --- owamp-3.4/owamp/endpoint.c	2014-03-21 09:37:42.000000000 -0400
	 +++ owamp-3.4.fixed/owamp/endpoint.c	2014-11-26 07:50:11.000000000 -0500
	 @@ -2188,6 +2188,11 @@
	 timespecsub((struct timespec*)&wake.it_value,&currtime);
	 wake.it_value.tv_usec /= 1000;        /* convert nsec to usec        */
	 +        while (wake.it_value.tv_usec >= 1000000) {
	 +            wake.it_value.tv_usec -= 1000000;
	 +            wake.it_value.tv_sec++;
	 +        }
	 +
	 tvalclear(&wake.it_interval);
	 /*
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
