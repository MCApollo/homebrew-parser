name :
	 Urlview
homepage :
	 https://packages.debian.org/sid/misc/urlview
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/urlview/urlview_0.9.orig.tar.gz
description :
	 URL extractor/launcher
build_deps :
link_deps :
conflicts :
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/urlview/urlview_0.9-20.diff.gz
EOF_patch :
install :
	 inreplace "urlview.man", "/etc/urlview/url_handler.sh", "open"
	 inreplace "urlview.c",
	 '#define DEFAULT_COMMAND "/etc/urlview/url_handler.sh %s"',
	 '#define DEFAULT_COMMAND "open %s"'
	 man1.mkpath
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
