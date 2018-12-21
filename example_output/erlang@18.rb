name :
	 ErlangAT18
homepage :
	 https://www.erlang.org/
url :
	 https://github.com/erlang/otp/archive/OTP-18.3.4.11.tar.gz
description :
	 Programming language for highly scalable real-time systems
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 openssl
	 wxmac
	 fop
	 :java
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/774ad1f/erlang%4018/boring-ssl-high-sierra.patch
	 https://github.com/erlang/otp/commit/a64c4d806fa54848c35632114585ad82b98712e8.diff?full_index=1
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 ENV["erl_cv_clock_gettime_monotonic_default_resolution"] = "no"
	 ENV["erl_cv_clock_gettime_monotonic_try_find_pthread_compatible"] = "no"
	 ENV["erl_cv_clock_gettime_wall_default_resolution"] = "no"
