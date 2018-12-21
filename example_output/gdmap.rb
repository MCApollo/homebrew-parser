name :
	 Gdmap
homepage :
	 https://sourceforge.net/projects/gdmap/
url :
	 https://downloads.sourceforge.net/project/gdmap/gdmap/0.8.1/gdmap-0.8.1.tar.gz
description :
	 Tool to inspect the used space of folders
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
	 gtk+
conflicts :
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index fc7ed80..bb408d3 100755
	 --- a/configure
	 +++ b/configure
	 @@ -8225,7 +8225,7 @@ else
	 echo "${ECHO_T}yes" >&6; }
	 :
	 fi
	 -UI_CFLAGS="$UI_CFLAGS -DGTK_DISABLE_DEPRECATED"
	 +#UI_CFLAGS="$UI_CFLAGS -DGTK_DISABLE_DEPRECATED"
	 diff --git a/src/gui_main.c b/src/gui_main.c
	 index efe2239..91c2a14 100644
	 --- a/src/gui_main.c
	 +++ b/src/gui_main.c
	 @@ -11,7 +11,6 @@
	 #endif
	 -#include <sys/vfs.h>
	 #include <stdlib.h>
	 #include <math.h>
	 #include <string.h>
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
