name :
	 Lockrun
homepage :
	 http://unixwiz.net/tools/lockrun.html
url :
	 http://unixwiz.net/tools/lockrun.c
description :
	 Run cron jobs with overrun protection
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, ENV.cflags, "lockrun.c", "-o", "lockrun"
	 bin.install "lockrun"
