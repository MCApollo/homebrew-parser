name :
	 Rrdtool
homepage :
	 https://oss.oetiker.ch/rrdtool/index.en.html
url :
	 https://github.com/oetiker/rrdtool-1.x/releases/download/v1.7.0/rrdtool-1.7.0.tar.gz
description :
	 Round Robin Database
build_deps :
	 pkg-config
link_deps :
	 glib
	 pango
optional_deps :
	 lua
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index 266754d..d21ab33 100755
	 --- a/configure
	 +++ b/configure
	 @@ -23868,18 +23868,6 @@ $as_echo_n "checking in... " >&6; }
	 { $as_echo "$as_me:${as_lineno-$LINENO}: result: and out again" >&5
	 $as_echo "and out again" >&6; }
	 -echo $ECHO_N "ordering CD from http://tobi.oetiker.ch/wish $ECHO_C" 1>&6
	 -sleep 1
	 -echo $ECHO_N ".$ECHO_C" 1>&6
	 -sleep 1
	 -echo $ECHO_N ".$ECHO_C" 1>&6
	 -sleep 1
	 -echo $ECHO_N ".$ECHO_C" 1>&6
	 -sleep 1
	 -echo $ECHO_N ".$ECHO_C" 1>&6
	 -sleep 1
	 -{ $as_echo "$as_me:${as_lineno-$LINENO}: result:  just kidding ;-)" >&5
	 -$as_echo " just kidding ;-)" >&6; }
	 echo
	 echo "----------------------------------------------------------------"
	 echo "Config is DONE!"
install :
	 ENV.delete("SDKROOT")
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-tcl
	 --with-tcllib=/usr/lib
	 --disable-perl-site-install
	 --disable-ruby-site-install
	 ]
	 system "./bootstrap" if build.head?
	 system "./configure", *args
	 ENV["ARCHFLAGS"] = "-arch #{MacOS.preferred_arch}"
	 system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}", "install"
	 prefix.install "bindings/ruby/test.rb"
