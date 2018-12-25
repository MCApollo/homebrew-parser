name :
	 Tmate
homepage :
	 https://tmate.io/
url :
	 https://github.com/tmate-io/tmate/archive/2.2.1.tar.gz
description :
	 Instant terminal sharing
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libevent
	 libssh
	 msgpack
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "sh", "autogen.sh"
	 ENV.append "LDFLAGS", "-lresolv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
