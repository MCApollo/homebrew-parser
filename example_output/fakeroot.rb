name :
	 Fakeroot
homepage :
	 https://tracker.debian.org/pkg/fakeroot
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/f/fakeroot/fakeroot_1.23.orig.tar.xz
description :
	 Provide a fake root environment
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;filename=0001-Implement-openat-2-wrapper-which-handles-optional-ar.patch;att=1;bug=766649
	 https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;filename=0002-OS-X-10.10-introduced-id_t-int-in-gs-etpriority.patch;att=2;bug=766649
EOF_patch :
	 index 15fdd1d..29d738d 100644
	 --- a/libfakeroot.c
	 +++ b/libfakeroot.c
	 @@ -2446,6 +2446,6 @@ int openat(int dir_fd, const char *pathname, int flags, ...)
	 va_end(args);
	 return next_openat(dir_fd, pathname, flags, mode);
	 }
	 -    return next_openat(dir_fd, pathname, flags);
	 +    return next_openat(dir_fd, pathname, flags, NULL);
	 }
	 #endif
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-static",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "wraptmpf.h"
	 (buildpath/"patch-for-wraptmpf-h").write <<~EOS
	 diff --git a/wraptmpf.h b/wraptmpf.h
	 index dbfccc9..0e04771 100644
	 --- a/wraptmpf.h
	 +++ b/wraptmpf.h
	 @@ -575,6 +575,10 @@ static __inline__ int next_mkdirat (int dir_fd, const char *pathname, mode_t mod
	 #endif /* HAVE_MKDIRAT */
	 #ifdef HAVE_OPENAT
	 extern int openat (int dir_fd, const char *pathname, int flags, ...);
	 +static __inline__ int next_openat (int dir_fd, const char *pathname, int flags, mode_t mode) __attribute__((always_inline));
	 +static __inline__ int next_openat (int dir_fd, const char *pathname, int flags, mode_t mode) {
	 +  return openat (dir_fd, pathname, flags, mode);
	 +}
	 #endif /* HAVE_OPENAT */
	 #ifdef HAVE_RENAMEAT
	 EOS
	 system "patch < patch-for-wraptmpf-h"
	 system "make"
	 system "make", "install"
