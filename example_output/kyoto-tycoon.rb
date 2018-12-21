name :
	 KyotoTycoon
homepage :
	 https://fallabs.com/kyototycoon/
url :
	 https://fallabs.com/kyototycoon/pkg/kyototycoon-0.9.56.tar.gz
description :
	 Database server with interface to Kyoto Cabinet
build_deps :
link_deps :
	 kyoto-cabinet
	 lua
conflicts :
patches :
EOF_patch :
	 --- a/ktdbext.h  2013-11-08 09:34:53.000000000 -0500
	 +++ b/ktdbext.h  2013-11-08 09:35:00.000000000 -0500
	 @@ -271,7 +271,7 @@
	 if (!logf("prepare", "started to open temporary databases under %s", tmppath.c_str()))
	 err = true;
	 stime = kc::time();
	 -      uint32_t pid = getpid() & kc::UINT16MAX;
	 +      uint32_t pid = kc::getpid() & kc::UINT16MAX;
	 uint32_t tid = kc::Thread::hash() & kc::UINT16MAX;
	 uint32_t ts = kc::time() * 1000;
	 for (size_t i = 0; i < dbnum_; i++) {
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-kc=#{Formula["kyoto-cabinet"].opt_prefix}",
	 "--with-lua=#{Formula["lua"].opt_prefix}"
	 system "make"
	 system "make", "install"
