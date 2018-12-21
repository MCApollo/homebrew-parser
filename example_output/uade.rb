name :
	 Uade
homepage :
	 http://zakalwe.fi/uade/
url :
	 https://github.com/heikkiorsila/bencode-tools.git
description :
	 Play Amiga tunes through UAE emulation
build_deps :
	 pkg-config
link_deps :
	 libao
conflicts :
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index 05bfa9b..a73608e 100755
	 --- a/configure
	 +++ b/configure
	 @@ -399,13 +399,13 @@ if test -n "$sharedir"; then
	 uadedatadir="$sharedir"
	 fi
	 -$NATIVECC -v 2>/dev/null >/dev/null
	 +$NATIVECC --version 2>/dev/null >/dev/null
	 if test "$?" != "0"; then
	 echo Native CC "$NATIVECC" not found, please install a C compiler
	 exit 1
	 fi
	 -$TARGETCC -v 2>/dev/null >/dev/null
	 +$TARGETCC --version 2>/dev/null >/dev/null
	 if test "$?" != "0"; then
	 echo Target CC "$TARGETCC" not found, please install a C compiler
	 exit 1
install :
	 if build.head?
	 resource("bencode-tools").stage do
	 system "./configure", "--prefix=#{prefix}", "--without-python"
	 system "make"
	 system "make", "install"
