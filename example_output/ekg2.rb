name :
	 Ekg2
homepage :
	 https://github.com/ekg2/ekg2
url :
	 https://src.fedoraproject.org/lookaside/extras/ekg2/ekg2-0.3.1.tar.gz/68fc05b432c34622df6561eaabef5a40/ekg2-0.3.1.tar.gz
description :
	 Multiplatform, multiprotocol, plugin-based instant messenger
build_deps :
	 pkg-config
link_deps :
	 openssl
	 readline
	 libgadu
conflicts :
patches :
EOF_patch :
	 diff --git a/compat/strlcat.c b/compat/strlcat.c
	 index 6077d66..c1c1804 100644
	 --- a/compat/strlcat.c
	 +++ b/compat/strlcat.c
	 @@ -14,7 +14,7 @@
	 *  License along with this program; if not, write to the Free Software
	 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
	 */
	 -
	 +#ifndef strlcat
	 #include <sys/types.h>
	 size_t strlcat(char *dst, const char *src, size_t size)
	 @@ -39,7 +39,7 @@ size_t strlcat(char *dst, const char *src, size_t size)
	 return dlen + j;
	 }
	 -
	 +#endif
	 /*
	 * Local Variables:
	 * mode: c
	 diff --git a/compat/strlcat.h b/compat/strlcat.h
	 index cb91fcb..df8f4b0 100644
	 --- a/compat/strlcat.h
	 +++ b/compat/strlcat.h
	 @@ -1,7 +1,8 @@
	 +#ifndef strlcat
	 #include <sys/types.h>
	 size_t strlcat(char *dst, const char *src, size_t size);
	 -
	 +#endif
	 /*
	 * Local Variables:
	 * mode: c
	 diff --git a/compat/strlcpy.c b/compat/strlcpy.c
	 index 31e41bd..4a40762 100644
	 --- a/compat/strlcpy.c
	 +++ b/compat/strlcpy.c
	 @@ -14,7 +14,7 @@
	 *  License along with this program; if not, write to the Free Software
	 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
	 */
	 -
	 +#ifndef strlcpy
	 #include <sys/types.h>
	 size_t strlcpy(char *dst, const char *src, size_t size)
	 @@ -32,7 +32,7 @@ size_t strlcpy(char *dst, const char *src, size_t size)
	 return i;
	 }
	 -
	 +#endif
	 /*
	 * Local Variables:
	 * mode: c
	 diff --git a/compat/strlcpy.h b/compat/strlcpy.h
	 index 1c80e20..93340af 100644
	 --- a/compat/strlcpy.h
	 +++ b/compat/strlcpy.h
	 @@ -1,7 +1,8 @@
	 +#ifndef strlcpy
	 #include <sys/types.h>
	 size_t strlcpy(char *dst, const char *src, size_t size);
	 -
	 +#endif
	 /*
	 * Local Variables:
	 * mode: c
install :
	 readline = Formula["readline"].opt_prefix
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --without-python
	 --without-perl
	 --with-readline=#{readline}
	 --without-gtk
	 --enable-unicode
	 ]
	 args << (build.with?("libgadu") ? "--with-libgadu" : "--without-libgadu")
	 system "./configure", *args
	 system "make", "install"
