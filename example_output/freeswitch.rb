name :
	 Freeswitch
homepage :
	 https://freeswitch.org
url :
	 https://freeswitch.org/stash/scm/fs/freeswitch.git
description :
	 Telephony platform to route various communication protocols
build_deps :
	 apr-util
	 autoconf
	 automake
	 libtool
	 pkg-config
	 yasm
link_deps :
	 jpeg
	 libsndfile
	 lua
	 openssl
	 opus
	 pcre
	 speex
	 speexdsp
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 ENV["ac_cv_lib_lzma_lzma_code"] = "no"
	 inreplace "build/modules.conf.in", "applications/mod_enum",
	 "#applications/mod_enum"
	 system "./bootstrap.sh", "-j"
	 inreplace "libs/tiff-4.0.2/configure.gnu", "--with-pic", "--with-pic --without-x"
	 system "./configure", "--disable-dependency-tracking",
	 "--enable-shared",
	 "--enable-static",
	 "--prefix=#{prefix}",
	 "--exec_prefix=#{prefix}"
	 system "make"
	 system "make", "install", "all"
	 if build.with?("moh")
	 mkdir_p prefix/"sounds/music"
	 [8, 16, 32, 48].each do |n|
	 resource("sounds-music-#{n}000").stage do
	 cp_r ".", prefix/"sounds/music"
	 end
	 end
