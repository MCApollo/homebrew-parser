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
optional_deps :
conflicts :
resource :
	 ['sounds-music-8000', 'sounds-music-16000', 'sounds-music-32000', 'sounds-music-48000', 'sounds-en-us-callie-8000', 'sounds-en-us-callie-16000', 'sounds-en-us-callie-32000', 'sounds-en-us-callie-48000', 'sounds-fr-ca-june-8000', 'sounds-fr-ca-june-16000', 'sounds-fr-ca-june-32000', 'sounds-fr-ca-june-48000', 'sounds-ru-RU-elena-8000', 'sounds-ru-RU-elena-16000', 'sounds-ru-RU-elena-32000', 'sounds-ru-RU-elena-48000']
	 ['#{sounds_url_base}/freeswitch-sounds-music-8000-#{moh_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-music-16000-#{moh_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-music-32000-#{moh_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-music-48000-#{moh_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-en-us-callie-8000-#{sounds_en_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-en-us-callie-16000-#{sounds_en_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-en-us-callie-32000-#{sounds_en_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-en-us-callie-48000-#{sounds_en_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-fr-ca-june-8000-#{sounds_fr_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-fr-ca-june-16000-#{sounds_fr_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-fr-ca-june-32000-#{sounds_fr_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-fr-ca-june-48000-#{sounds_fr_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-ru-RU-elena-8000-#{sounds_ru_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-ru-RU-elena-16000-#{sounds_ru_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-ru-RU-elena-32000-#{sounds_ru_version}.tar.gz', '#{sounds_url_base}/freeswitch-sounds-ru-RU-elena-48000-#{sounds_ru_version}.tar.gz']
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
