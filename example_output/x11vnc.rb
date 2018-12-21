name :
	 X11vnc
homepage :
	 http://www.karlrunge.com/x11vnc/
url :
	 https://downloads.sourceforge.net/project/libvncserver/x11vnc/0.9.13/x11vnc-0.9.13.tar.gz
description :
	 VNC server for real X displays
build_deps :
link_deps :
	 jpeg
	 openssl
	 :x11
conflicts :
patches :
EOF_patch :
	 diff --git a/x11vnc/solid.c b/x11vnc/solid.c
	 index d6b0bda..0b2cfa9 100644
	 --- a/x11vnc/solid.c
	 +++ b/x11vnc/solid.c
	 @@ -177,7 +177,7 @@ unsigned long get_pixel(char *color) {
	 XImage *solid_root(char *color) {
	 #if NO_X11
	 -	RAWFB_RET_VOID
	 +	RAWFB_RET(NULL)
	 if (!color) {}
	 return NULL;
	 #else
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 ]
	 if build.with? "x11"
	 args << "--with-x"
	 else
	 args << "--without-x"
