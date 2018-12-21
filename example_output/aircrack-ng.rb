name :
	 AircrackNg
homepage :
	 https://aircrack-ng.org/
url :
	 https://download.aircrack-ng.org/aircrack-ng-1.5.2.tar.gz
description :
	 Next-generation aircrack with lots of new features
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 openssl
	 pcre
	 sqlite
conflicts :
patches :
EOF_patch :
	 --- a/scripts/airodump-ng-oui-update
	 +++ b/scripts/airodump-ng-oui-update
	 @@ -20,25 +20,6 @@ fi
	 AIRODUMP_NG_OUI="${OUI_PATH}/airodump-ng-oui.txt"
	 OUI_IEEE="${OUI_PATH}/oui.txt"
	 -USERID=""
	 -
	 -
	 -
	 -if [ x"`which id 2> /dev/null`" != "x" ]
	 -then
	 -	USERID="`id -u 2> /dev/null`"
	 -fi
	 -
	 -if [ x$USERID = "x" -a x$(id -ru) != "x" ]
	 -then
	 -	USERID=$(id -ru)
	 -fi
	 -
	 -if [ x$USERID != "x" -a x$USERID != "x0" ]
	 -then
	 -	echo Run it as root ; exit ;
	 -fi
	 -
	 if [ ! -d "${OUI_PATH}" ]; then
	 mkdir -p ${OUI_PATH}
install :
	 system "./autogen.sh", "--disable-silent-rules",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-experimental"
	 system "make", "install"
