name :
	 KyotoCabinet
homepage :
	 https://fallabs.com/kyotocabinet/
url :
	 https://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.76.tar.gz
description :
	 Library of routines for managing a database
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- a/kccommon.h  2013-11-08 09:27:37.000000000 -0500
	 +++ b/kccommon.h  2013-11-08 09:27:47.000000000 -0500
	 @@ -82,7 +82,7 @@
	 using ::snprintf;
	 }
	 -#if __cplusplus > 199711L || defined(__GXX_EXPERIMENTAL_CXX0X__) || defined(_MSC_VER)
	 +#if __cplusplus > 199711L || defined(__GXX_EXPERIMENTAL_CXX0X__) || defined(_MSC_VER) || defined(_LIBCPP_VERSION)
	 #include <unordered_map>
	 #include <unordered_set>
install :
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
