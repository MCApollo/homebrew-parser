name :
	 Cgit
homepage :
	 https://git.zx2c4.com/cgit/
url :
	 https://git.zx2c4.com/cgit/snapshot/cgit-1.2.tar.xz
description :
	 Hyperfast web frontend for Git repositories written in C
build_deps :
link_deps :
	 gettext
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 resource("git").stage(buildpath/"git")
	 system "make", "prefix=#{prefix}",
	 "CGIT_SCRIPT_PATH=#{pkgshare}",
	 "CGIT_DATA_PATH=#{var}/www/htdocs/cgit",
	 "CGIT_CONFIG=#{etc}/cgitrc",
	 "CACHE_ROOT=#{var}/cache/cgit",
	 "install"
