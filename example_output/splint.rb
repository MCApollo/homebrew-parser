name :
	 Splint
homepage :
	 https://sourceforge.net/projects/splint/
url :
	 https://mirrorservice.org/sites/distfiles.macports.org/splint/splint-3.1.2.src.tgz
description :
	 Secure Programming Lint
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/src/osd.c b/src/osd.c
	 index ebe214a..4ba81d5 100644
	 --- a/src/osd.c
	 +++ b/src/osd.c
	 @@ -516,7 +516,7 @@ osd_getPid ()
	 int pid = _getpid ();
	 -  __pid_t pid = getpid ();
	 +  pid_t pid = getpid ();
	 return (int) pid;
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
