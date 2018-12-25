name :
	 Nss
homepage :
	 https://developer.mozilla.org/docs/NSS
url :
	 https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_41_RTM/src/nss-3.41.tar.gz
description :
	 Libraries for security-enabled client and server applications
build_deps :
link_deps :
	 nspr
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cd "nss"
	 args = %W[
	 BUILD_OPT=1
	 NSS_USE_SYSTEM_SQLITE=1
	 NSPR_INCLUDE_DIR=#{Formula["nspr"].opt_include}/nspr
	 NSPR_LIB_DIR=#{Formula["nspr"].opt_lib}
	 ]
	 args << "USE_64=1" if MacOS.prefer_64_bit?
	 inreplace "coreconf/Darwin.mk", "-install_name @executable_path", "-install_name #{lib}"
	 inreplace "lib/freebl/config.mk", "@executable_path", lib
	 system "make", "all", *args
	 cd "../dist"
	 bin.mkpath
	 Dir.glob("Darwin*/bin/*") do |file|
	 cp file, bin unless file.include? ".dylib"
	 end
	 include_target = include + "nss"
	 include_target.mkpath
	 Dir.glob("public/{dbm,nss}/*") { |file| cp file, include_target }
	 lib.mkpath
	 libexec.mkpath
	 Dir.glob("Darwin*/lib/*") do |file|
	 if file.include? ".chk"
	 cp file, libexec
	 else
	 cp file, lib
	 end
	 end
	 rm lib/"libssl.a"
	 (bin/"nss-config").write config_file
	 (lib/"pkgconfig/nss.pc").write pc_file
