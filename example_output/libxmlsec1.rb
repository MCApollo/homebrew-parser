name :
	 Libxmlsec1
homepage :
	 https://www.aleksey.com/xmlsec/
url :
	 https://www.aleksey.com/xmlsec/download/xmlsec1-1.2.27.tar.gz
description :
	 XML security library
build_deps :
	 pkg-config
link_deps :
	 gnutls
	 libgcrypt
	 libxml2
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/dl.c b/src/dl.c
	 index 6e8a56a..0e7f06b 100644
	 --- a/src/dl.c
	 +++ b/src/dl.c
	 @@ -141,6 +141,7 @@ xmlSecCryptoDLLibraryCreate(const xmlChar* name) {
	 }
	 #ifdef XMLSEC_DL_LIBLTDL
	 +    lt_dlsetsearchpath("HOMEBREW_PREFIX/lib");
	 lib->handle = lt_dlopenext((char*)lib->filename);
	 if(lib->handle == NULL) {
	 xmlSecError(XMLSEC_ERRORS_HERE,
install :
	 args = ["--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-crypto-dl",
	 "--disable-apps-crypto-dl",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"]
	 args << "--with-libxml=#{Formula["libxml2"].opt_prefix}" if build.with? "libxml2"
	 system "./configure", *args
	 system "make", "install"
