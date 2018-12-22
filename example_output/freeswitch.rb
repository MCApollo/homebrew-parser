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
	 end
	 if build.with?("sounds-en")
	 mkdir_p prefix/"sounds/en"
	 [8, 16, 32, 48].each do |n|
	 resource("sounds-en-us-callie-#{n}000").stage do
	 cp_r ".", prefix/"sounds/en"
	 end
	 end
	 end
	 if build.with?("sounds-fr")
	 mkdir_p prefix/"sounds/fr"
	 [8, 16, 32, 48].each do |n|
	 resource("sounds-fr-ca-june-#{n}000").stage do
	 cp_r ".", prefix/"sounds/fr"
	 end
	 end
	 end
	 if build.with?("sounds-ru")
	 mkdir_p prefix/"sounds/ru"
	 [8, 16, 32, 48].each do |n|
	 resource("sounds-ru-RU-elena-#{n}000").stage do
	 cp_r ".", prefix/"sounds/ru"
	 end
	 end
	 end
