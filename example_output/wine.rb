name :
	 Wine
homepage :
	 https://www.winehq.org/
url :
	 https://dl.winehq.org/wine/source/3.0/wine-3.0.4.tar.xz
description :
	 Run Windows applications without a copy of Microsoft Windows
build_deps :
	 cmake
	 makedepend
	 pkg-config
link_deps :
	 :maximum_macos
	 :maximum_macos
	 :macos
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/74c2566/wine/2.14.patch
EOF_patch :
install :
	 if DevelopmentTools.clang_build_version >= 1000
	 odie <<~EOS
	 Wine cannot currently be installed from source on
	 macOS #{MacOS.version}.
	 You may wish to try:
	 brew install wine --force-bottle
	 EOS
	 end
	 ENV.prepend_create_path "PATH", "#{libexec}/bin"
	 ENV.prepend_create_path "PKG_CONFIG_PATH", "#{libexec}/lib/pkgconfig"
	 resource("openssl").stage do
	 save_env do
	 ENV.deparallelize
	 ENV.permit_arch_flags
	 ENV.delete("PERL")
	 ENV.delete("PERL5LIB")
	 archs = Hardware::CPU.universal_archs
	 dirs = []
	 archs.each do |arch|
	 dir = "build-#{arch}"
	 dirs << dir
	 mkdir_p "#{dir}/engines"
	 system "make", "clean"
	 system "perl", "./Configure", "--prefix=#{libexec}",
	 "no-ssl2",
	 "no-ssl3",
	 "no-zlib",
	 "shared",
	 "enable-cms",
	 *openssl_arch_args[arch]
	 system "make", "depend"
	 system "make"
	 cp "include/openssl/opensslconf.h", dir
	 cp Dir["*.?.?.?.dylib", "*.a", "apps/openssl"], dir
	 cp Dir["engines/**/*.dylib"], "#{dir}/engines"
	 end
	 system "make", "install"
	 %w[libcrypto libssl].each do |libname|
	 rm_f libexec/"lib/#{libname}.1.0.0.dylib"
	 MachO::Tools.merge_machos("#{libexec}/lib/#{libname}.1.0.0.dylib",
	 "#{dirs.first}/#{libname}.1.0.0.dylib",
	 "#{dirs.last}/#{libname}.1.0.0.dylib")
	 rm_f libexec/"lib/#{libname}.a"
	 end
	 Dir.glob("#{dirs.first}/engines/*.dylib") do |engine|
	 libname = File.basename(engine)
	 rm_f libexec/"lib/engines/#{libname}"
	 MachO::Tools.merge_machos("#{libexec}/lib/engines/#{libname}",
	 "#{dirs.first}/engines/#{libname}",
	 "#{dirs.last}/engines/#{libname}")
	 end
	 MachO::Tools.merge_machos("#{libexec}/bin/openssl",
	 "#{dirs.first}/openssl",
	 "#{dirs.last}/openssl")
	 confs = archs.map do |arch|
	 <<~EOS
	 #ifdef __#{arch}__
	 #{(Pathname.pwd/"build-#{arch}/opensslconf.h").read}
	 #endif
	 EOS
	 end
	 (libexec/"include/openssl/opensslconf.h").atomic_write confs.join("\n")
	 end
	 end
	 depflags = ["CPPFLAGS=-I#{libexec}/include", "LDFLAGS=-L#{libexec}/lib"]
	 save_env do
	 ENV.universal_binary
	 resource("libtool").stage do
	 ENV["SED"] = "sed"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--program-prefix=g",
	 "--enable-ltdl-install"
	 system "make", "install"
	 end
	 resource("jpeg").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static"
	 system "make", "install"
	 end
	 resource("libtiff").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--disable-lzma",
	 "--without-x",
	 "--with-jpeg-lib-dir=#{libexec}/lib",
	 "--with-jpeg-include-dir=#{libexec}/include"
	 system "make", "install"
	 end
	 resource("little-cms2").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--with-jpeg=#{libexec}",
	 "--with-tiff=#{libexec}"
	 system "make", "install"
	 end
	 resource("libpng").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static"
	 system "make", "install"
	 end
	 resource("freetype").stage do
	 system "./configure", "--prefix=#{libexec}",
	 "--disable-static",
	 "--without-harfbuzz",
	 *depflags
	 system "make", "install"
	 end
	 resource("libusb").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static"
	 system "make", "install"
	 end
	 resource("webp").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--disable-gl",
	 "--enable-libwebpmux",
	 "--enable-libwebpdemux",
	 "--enable-libwebpdecoder",
	 *depflags
	 system "make", "install"
	 end
	 resource("fontconfig").stage do
	 font_dirs = %w[/System/Library/Fonts /Library/Fonts ~/Library/Fonts]
	 if MacOS.version >= :sierra
	 font_dirs << Dir["/System/Library/Assets/com_apple_MobileAsset_Font*"].max
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--with-add-fonts=#{font_dirs.join(",")}",
	 "--localstatedir=#{var}/vendored_wine_fontconfig",
	 "--sysconfdir=#{prefix}",
	 *depflags
	 system "make", "install", "RUN_FC_CACHE_TEST=false"
	 end
	 resource("gd").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--without-x",
	 "--without-xpm",
	 "--with-png=#{libexec}",
	 "--with-fontconfig=#{libexec}",
	 "--with-freetype=#{libexec}",
	 "--with-jpeg=#{libexec}",
	 "--with-tiff=#{libexec}",
	 "--with-webp=#{libexec}"
	 system "make", "install"
	 end
	 resource("libgphoto2").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 *depflags
	 system "make", "install"
	 end
	 resource("net-snmp").stage do
	 ln_s "darwin13.h", "include/net-snmp/system/darwin18.h"
	 system "./configure", "--disable-debugging",
	 "--prefix=#{libexec}",
	 "--disable-static",
	 "--enable-ipv6",
	 "--with-defaults",
	 "--with-persistent-directory=#{var}/db/net-snmp_vendored_wine",
	 "--with-logfile=#{var}/log/snmpd_vendored_wine.log",
	 "--with-mib-modules=host\ ucd-snmp/diskio",
	 "--without-rpm",
	 "--without-kmem-usage",
	 "--disable-embedded-perl",
	 "--without-perl-modules",
	 "--with-openssl=#{libexec}",
	 *depflags
	 system "make"
	 system "make", "install"
	 end
	 resource("sane-backends").stage do
	 save_env do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--localstatedir=#{var}",
	 "--without-gphoto2",
	 "--enable-local-backends",
	 "--with-usb=yes",
	 *depflags
	 system "make"
	 system "make", "install"
	 end
	 end
	 resource("mpg123").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{libexec}",
	 "--with-default-audio=coreaudio",
	 "--with-module-suffix=.so",
	 "--with-cpu=generic"
	 system "make", "install"
	 end
	 end
	 %w[freetype jpeg png sane tiff].each do |dep|
	 ENV["ac_cv_lib_soname_#{dep}"] = (libexec/"lib/lib#{dep}.dylib").realpath
	 end
	 mkdir "wine-64-build" do
	 system "../configure", "--prefix=#{prefix}",
	 "--enable-win64",
	 "--without-x",
	 *depflags
	 system "make", "install"
	 end
	 mkdir "wine-32-build" do
	 ENV.m32
	 system "../configure", "--prefix=#{prefix}",
	 "--with-wine64=../wine-64-build",
	 "--without-x",
	 *depflags
	 system "make", "install"
	 end
	 (pkgshare/"gecko").install resource("gecko-x86")
	 (pkgshare/"gecko").install resource("gecko-x86_64")
	 (pkgshare/"mono").install resource("mono")
	 ohai "Regenerating font cache, this may take a while"
	 system "#{libexec}/bin/fc-cache", "-frv"
	 (var/"db/net-snmp_vendored_wine").mkpath
	 (var/"log").mkpath
