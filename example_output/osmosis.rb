name :
	 Osmosis
homepage :
	 https://wiki.openstreetmap.org/wiki/Osmosis
url :
	 https://bretth.dev.openstreetmap.org/osmosis-build/osmosis-0.45.zip
description :
	 Command-line OpenStreetMap data processor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 --- a/bin/osmosis 2010-11-16 06:58:44.000000000 +0100
	 +++ b/bin/osmosis  2010-11-23 12:13:01.000000000 +0100
	 @@ -83,6 +83,7 @@
	 saveddir=`pwd`
	 MYAPP_HOME=`dirname "$PRG"`/..
	 MYAPP_HOME=`cd "$MYAPP_HOME" && pwd`
	 +MYAPP_HOME="$MYAPP_HOME/libexec"
	 cd "$saveddir"
install :
