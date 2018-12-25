name :
	 Icecream
homepage :
	 https://en.opensuse.org/Icecream
url :
	 https://github.com/icecc/icecream/archive/1.2.tar.gz
description :
	 Distributed compiler with a central scheduler to share build load
build_deps :
	 autoconf
	 automake
	 docbook2x
	 libtool
link_deps :
	 lzo
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-clang-wrappers
	 ]
	 system "./autogen.sh"
	 system "./configure", *args
	 system "make", "install"
	 (prefix/"org.opensuse.icecc.plist").write iceccd_plist
	 (prefix/"org.opensuse.icecc-scheduler.plist").write scheduler_plist
