name :
	 Rdesktop
homepage :
	 https://www.rdesktop.org/
url :
	 https://downloads.sourceforge.net/project/rdesktop/rdesktop/1.8.3/rdesktop-1.8.3.tar.gz
description :
	 UNIX client for connecting to Windows Remote Desktop Services
build_deps :
link_deps :
	 openssl
	 :x11
conflicts :
patches :
EOF_patch :
	 diff --git a/scard.c b/scard.c
	 index caa0745..5521ee9 100644
	 --- a/scard.c
	 +++ b/scard.c
	 @@ -2152,7 +2152,6 @@ TS_SCardControl(STREAM in, STREAM out)
	 {
	 /* Translate to local encoding */
	 dwControlCode = (dwControlCode & 0x3ffc) >> 2;
	 -		dwControlCode = SCARD_CTL_CODE(dwControlCode);
	 }
	 else
	 {
	 @@ -2198,7 +2197,7 @@ TS_SCardControl(STREAM in, STREAM out)
	 }
	 #ifdef PCSCLITE_VERSION_NUMBER
	 -	if (dwControlCode == SCARD_CTL_CODE(3400))
	 +	if (0)
	 {
	 int i;
	 SERVER_DWORD cc;
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-credssp
	 --enable-smartcard
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --x-includes=#{MacOS::X11.include}
	 --x-libraries=#{MacOS::X11.lib}
	 ]
	 system "./configure", *args
	 system "make", "install"
