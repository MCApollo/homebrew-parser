name :
	 Msdl
homepage :
	 https://msdl.sourceforge.io
url :
	 https://downloads.sourceforge.net/msdl/msdl-1.2.7-r2.tar.gz
description :
	 Downloader for various streaming protocols
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/url.c b/src/url.c
	 index 81783c7..356883a 100644
	 --- a/src/url.c
	 +++ b/src/url.c
	 @@ -266,7 +266,7 @@ void url_unescape_string(char *dst,char *src)
	 /*
	 * return true if 'c' is valid url character
	 */
	 -inline int is_url_valid_char(int c)
	 +int is_url_valid_char(int c)
	 {
	 return (isalpha(c) ||
	 isdigit(c) ||
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
