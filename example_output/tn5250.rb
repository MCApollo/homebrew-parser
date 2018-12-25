name :
	 Tn5250
homepage :
	 https://tn5250.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/tn5250/tn5250/0.17.4/tn5250-0.17.4.tar.gz
description :
	 5250 terminal and printer emulator
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/curses/cursesterm.c b/curses/cursesterm.c
	 index bf20f05..b9c394c 100644
	 --- a/curses/cursesterm.c
	 +++ b/curses/cursesterm.c
	 @@ -22,6 +22,9 @@
	 #define _TN5250_TERMINAL_PRIVATE_DEFINED
	 #include "tn5250-private.h"
	 #include "cursesterm.h"
	 +#ifdef __APPLE__
	 +#include <term.h>
	 +#endif
	 #ifdef USE_CURSES
	 diff --git a/curses/tn5250.c b/curses/tn5250.c
	 index 30a1627..67392b1 100644
	 --- a/curses/tn5250.c
	 +++ b/curses/tn5250.c
	 @@ -19,6 +19,7 @@
	 */
	 #include "tn5250-private.h"
	 +#include "cursesterm.h"
	 Tn5250Session *sess = NULL;
	 Tn5250Stream *stream = NULL;
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
