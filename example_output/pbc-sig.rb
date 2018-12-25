name :
	 PbcSig
homepage :
	 https://crypto.stanford.edu/pbc/sig/
url :
	 https://crypto.stanford.edu/pbc/sig/files/pbc_sig-0.0.8.tar.gz
description :
	 Signatures library
build_deps :
link_deps :
	 pbc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/sig/bbs.c b/sig/bbs.c
	 index ed1b437..8aa8331 100644
	 --- a/sig/bbs.c
	 +++ b/sig/bbs.c
	 @@ -1,4 +1,5 @@
	 //see Boneh, Boyen and Shacham, "Short Group Signatures"
	 +#include <stdint.h>
	 #include <pbc/pbc_utils.h>
	 #include "pbc_sig.h"
	 #include "pbc_hash.h"
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
