name :
	 Znapzend
homepage :
	 https://www.znapzend.org/
url :
	 https://github.com/oetiker/znapzend/releases/download/v0.19.1/znapzend-0.19.1.tar.gz
description :
	 ZFS backup with remote capabilities and mbuffer integration
build_deps :
link_deps :
	 perl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 (var/"log/znapzend").mkpath
	 (var/"run/znapzend").mkpath
