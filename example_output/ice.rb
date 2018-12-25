name :
	 Ice
homepage :
	 https://zeroc.com
url :
	 https://github.com/zeroc-ice/ice/archive/v3.7.1.tar.gz
description :
	 Comprehensive RPC framework
build_deps :
link_deps :
	 lmdb
	 :macos
	 mcpp
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/zeroc-ice/ice/compare/v3.7.1..v3.7.1-xcode10.patch?full_index=1
EOF_patch :
install :
	 ENV.O2
	 ENV["GRADLE_USER_HOME"] = "#{buildpath}/.gradle"
	 args = [
	 "prefix=#{prefix}",
	 "V=1",
	 "MCPP_HOME=#{Formula["mcpp"].opt_prefix}",
	 "LMDB_HOME=#{Formula["lmdb"].opt_prefix}",
	 "CONFIGS=shared cpp11-shared xcodesdk cpp11-xcodesdk",
	 "PLATFORMS=all",
	 "SKIP=slice2confluence slice2py slice2rb slice2js",
	 "LANGUAGES=cpp objective-c #{build.with?("java") ? "java java-compat" : ""}",
	 ]
	 system "make", "install", *args
