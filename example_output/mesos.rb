name :
	 Mesos
homepage :
	 https://mesos.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=mesos/1.6.1/mesos-1.6.1.tar.gz
description :
	 Apache cluster manager
build_deps :
	 maven
link_deps :
	 apr-util
	 :java
	 :macos
	 python@2
	 subversion
conflicts :
	 nanopb-generator
patches :
EOF_patch :
install :
	 #
	 ENV.O0 unless DevelopmentTools.clang_build_version >= 900
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 ENV["ac_have_clock_syscall"] = "no"
