name :
	 Vip
homepage :
	 https://www.cs.duke.edu/~des/vip.html
url :
	 https://www.cs.duke.edu/~des/scripts/vip
description :
	 Program that provides for interactive editing in a pipeline
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['man']
	 ['https://www.cs.duke.edu/~des/scripts/vip.man']
patches :
EOF_patch :
	 diff --git a/vip b/vip
	 index f150167..e517675 100644
	 --- a/vip
	 +++ b/vip
	 @@ -66,7 +66,7 @@ Usage:  $PROG [ -no ] [ command ]
	 otherwise stdin is used;
	 "
	 -: ${TMPDIR:="/usr/tmp"}
	 +: ${TMPDIR:="/var/tmp"}
	 TEMP_FILE="$TMPDIR/$PROG.$$"
	 COMMAND="cat"
	 DFLT_ED="vi"
	 @@ -81,6 +81,10 @@ case "$SYS" in
	 ;;
	 "HP-UX "*)
	 AWK=awk
	 +	;;
	 +  "Darwin "*)
	 +	AWK=awk
	 +	;;
	 esac
	 #
install :
	 bin.install "vip"
	 resource("man").stage do
	 man1.install "vip.man" => "vip.1"
	 end
