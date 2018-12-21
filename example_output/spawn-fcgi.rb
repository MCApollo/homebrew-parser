name :
	 SpawnFcgi
homepage :
	 https://redmine.lighttpd.net/projects/spawn-fcgi
url :
	 https://www.lighttpd.net/download/spawn-fcgi-1.6.4.tar.gz
description :
	 Spawn fast-CGI processes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
