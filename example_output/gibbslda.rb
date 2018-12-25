name :
	 Gibbslda
homepage :
	 https://gibbslda.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gibbslda/GibbsLDA%2B%2B/0.2/GibbsLDA%2B%2B-0.2.tar.gz
description :
	 Library wrapping imlib2's context API
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/utils.cpp b/src/utils.cpp
	 index e2f538b..1df5fb3 100644
	 --- a/src/utils.cpp
	 +++ b/src/utils.cpp
	 @@ -22,6 +22,7 @@
	 */
	 #include <stdio.h>
	 +#include <stdlib.h>
	 #include <string>
	 #include <map>
	 #include "strtokenizer.h"
install :
	 system "make", "clean"
	 system "make", "all"
	 bin.install "src/lda"
	 share.install "docs/GibbsLDA++Manual.pdf"
