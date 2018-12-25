name :
	 Dirac
homepage :
	 https://sourceforge.net/projects/dirac/
url :
	 https://downloads.sourceforge.net/project/dirac/dirac-codec/Dirac-1.0.2/dirac-1.0.2.tar.gz
description :
	 General-purpose video codec aimed at a range of resolutions
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/mistydemeo/da8a53abcf057c58b498/raw/bde69c5f07d871542dcb24792110e29e6418d2a3/unititialized-memory.patch
	 https://gist.githubusercontent.com/mistydemeo/e729c459525d0d6e9e2d/raw/d9ff69c944b8bde006eef27650c0af36f51479f5/dirac-gcc-fixes.patch
EOF_patch :
	 diff --git a/configure b/configure
	 index 41329b9..8f5ed19 100755
	 --- a/configure
	 +++ b/configure
	 @@ -15903,30 +15903,8 @@ ACLOCAL_AMFLAGS="-I m4 $ACLOCAL_AMFLAGS"
	 use_msvc=no
	 -case "$CXX" in
	 -		cl*|CL*)
	 -		CXXFLAGS="-nologo -W1 -EHsc -DWIN32"
	 -		if test x"$enable_shared" = "xyes"; then
	 -		    LIBEXT=".dll";
	 -		    LIBFLAGS="-DLL -INCREMENTAL:NO"
	 -			CXXFLAGS="$CXXFLAGS -D_WINDLL"
	 -		else
	 -		    LIBEXT=".lib";
	 -		    LIBFLAGS="-lib"
	 -		fi
	 -		RANLIB="echo"
	 -		use_msvc=yes
	 -		;;
	 -	*)
	 -		;;
	 -esac
	 - if test x"$use_msvc" = "xyes"; then
	 -  USE_MSVC_TRUE=
	 -  USE_MSVC_FALSE='#'
	 -else
	 USE_MSVC_TRUE='#'
	 USE_MSVC_FALSE=
	 -fi
	 @@ -22678,7 +22656,8 @@ $debug ||
	 if test -n "$CONFIG_FILES"; then
	 -ac_cr='
	 '
	 +ac_cr='
	 +'
	 ac_cs_awk_cr=`$AWK 'BEGIN { print "a\rb" }' </dev/null 2>/dev/null`
	 if test "$ac_cs_awk_cr" = "a${ac_cr}b"; then
	 ac_cs_awk_cr='\\r'
install :
	 inreplace "doc/Makefile.in", "cp -dR", "cp -R"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
