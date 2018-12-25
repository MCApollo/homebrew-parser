name :
	 Gwyddion
homepage :
	 http://gwyddion.net/
url :
	 http://gwyddion.net/download/2.52/gwyddion-2.52.tar.gz
description :
	 Scanning Probe Microscopy visualization and analysis tool
build_deps :
	 pkg-config
link_deps :
	 fftw
	 gtk+
	 gtk-mac-integration
	 gtkglext
	 gtksourceview
	 libxml2
	 minizip
	 pygtk
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/gwyddion/mac_integration.c b/gwyddion/mac_integration.c
	 index 740184b..2476004 100644
	 --- a/gwyddion/mac_integration.c
	 +++ b/gwyddion/mac_integration.c
	 @@ -22,7 +22,7 @@
	 #ifdef __APPLE__
	 #include <AppKit/AppKit.h>
	 #include <CoreFoundation/CoreFoundation.h>
	 -#include <file.h>
	 +#include <app/file.h>
	 #include "config.h"
	 #ifdef HAVE_GTK_MAC_INTEGRATION
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-desktop-file-update",
	 "--prefix=#{prefix}",
	 "--with-html-dir=#{doc}"
	 system "make", "install"
