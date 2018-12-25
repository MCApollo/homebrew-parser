name :
	 EmacsClangCompleteAsync
homepage :
	 https://github.com/Golevka/emacs-clang-complete-async
url :
description :
	 Emacs plugin using libclang to complete C/C++ code
build_deps :
link_deps :
	 llvm
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/yocchi/emacs-clang-complete-async/commit/5ce197b15d7b8c9abfc862596bf8d902116c9efe.diff?full_index=1
EOF_patch :
	 --- a/src/completion.h	2013-05-26 17:27:46.000000000 +0200
	 +++ b/src/completion.h	2014-02-11 21:40:18.000000000 +0100
	 @@ -3,6 +3,7 @@
	 #include <clang-c/Index.h>
	 +#include <stdio.h>
	 typedef struct __completion_Session_struct
install :
	 system "make"
	 bin.install "clang-complete"
	 share.install "auto-complete-clang-async.el" if build.with? "elisp"
