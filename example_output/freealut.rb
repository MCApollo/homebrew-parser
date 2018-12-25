name :
	 Freealut
homepage :
	 https://github.com/vancegroup/freealut
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/f/freealut/freealut_1.1.0.orig.tar.gz
description :
	 Implementation of OpenAL's ALUT standard
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/configure.ac b/configure.ac
	 index 2b26d6d..4001db1 100644
	 --- a/configure.ac
	 +++ b/configure.ac
	 @@ -83,7 +83,8 @@ AC_DEFINE([ALUT_BUILD_LIBRARY], [1], [Define to 1 if you want to build the ALUT
	 AC_SEARCH_LIBS([pthread_self], [pthread])
	 -AC_SEARCH_LIBS([alGetError], [openal32 openal])
	 +
	 +LIBS="$LIBS -framework IOKit -framework OpenAL"
	 ################################################################################
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
