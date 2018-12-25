name :
	 Cdrdao
homepage :
	 https://cdrdao.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cdrdao/cdrdao-1.2.4.tar.bz2
description :
	 Record CDs in Disk-At-Once mode
build_deps :
	 pkg-config
link_deps :
	 lame
	 libao
	 libvorbis
	 mad
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://sourceforge.net/p/cdrdao/patches/_discuss/thread/205354b0/141e/attachment/cdrdao-mac.patch
EOF_patch :
	 --- dao/main.cc	2013-11-26 12:00:00.000000000 -0400
	 +++ dao/main.cc	2013-11-26 12:00:00.000000000 -0400
	 @@ -1242,7 +1242,7 @@
	 const char* getDefaultDevice(DaoDeviceType req)
	 {
	 int i, len;
	 -    static char buf[128];
	 +    static char buf[1024];
	 // This function should not be called if the command issues
	 // doesn't actually require a device.
	 @@ -1270,7 +1270,7 @@
	 if (req == NEED_CDRW_W && !rww)
	 continue;
	 -	    strncpy(buf, sdata[i].dev.c_str(), 128);
	 +	    strncpy(buf, sdata[i].dev.c_str(), 1024);
	 delete[] sdata;
	 return buf;
	 }
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
