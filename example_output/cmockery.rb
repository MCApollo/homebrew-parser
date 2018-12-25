name :
	 Cmockery
homepage :
	 https://github.com/google/cmockery
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cmockery/cmockery-0.1.2.tar.gz
description :
	 Unit testing and mocking library for C
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff -uNr cmockery-0.1.2.orig/src/cmockery.c cmockery-0.1.2/src/cmockery.c
	 --- cmockery-0.1.2.orig/src/cmockery.c	2008-08-29 19:55:53.000000000 -0600
	 +++ cmockery-0.1.2/src/cmockery.c	2009-05-31 15:29:25.000000000 -0600
	 @@ -13,7 +13,12 @@
	 * See the License for the specific language governing permissions and
	 * limitations under the License.
	 */
	 +#ifdef HAVE_CONFIG_H
	 +#include "config.h"
	 +#endif
	 +#ifdef HAVE_MALLOC_H
	 #include <malloc.h>
	 +#endif
	 #include <setjmp.h>
	 #ifndef _WIN32
	 #include <signal.h>
	 diff -uNr cmockery-0.1.2.orig/src/example/allocate_module.c cmockery-0.1.2/src/example/allocate_module.c
	 --- cmockery-0.1.2.orig/src/example/allocate_module.c	2008-08-29 16:23:29.000000000 -0600
	 +++ cmockery-0.1.2/src/example/allocate_module.c	2009-05-31 15:29:48.000000000 -0600
	 @@ -13,7 +13,13 @@
	 * See the License for the specific language governing permissions and
	 * limitations under the License.
	 */
	 +#ifdef HAVE_CONFIG_H
	 +#include "config.h"
	 +#endif
	 +#ifdef HAVE_MALLOC_H
	 #include <malloc.h>
	 +#endif
	 +#include <sys/types.h>
	 #if UNIT_TESTING
	 extern void* _test_malloc(const size_t size, const char* file, const int line);
	 diff -uNr cmockery-0.1.2.orig/src/example/calculator.c cmockery-0.1.2/src/example/calculator.c
	 --- cmockery-0.1.2.orig/src/example/calculator.c	2008-08-29 16:23:29.000000000 -0600
	 +++ cmockery-0.1.2/src/example/calculator.c	2009-05-31 15:30:08.000000000 -0600
	 @@ -16,8 +16,13 @@
	 // A calculator example used to demonstrate the cmockery testing library.
	 +#ifdef HAVE_CONFIG_H
	 +#include "config.h"
	 +#endif
	 #include <assert.h>
	 +#ifdef HAVE_MALLOC_H
	 #include <malloc.h>
	 +#endif
	 #include <stdio.h>
	 #include <stdlib.h>
	 #include <string.h>
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
