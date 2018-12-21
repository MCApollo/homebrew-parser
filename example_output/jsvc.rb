name :
	 Jsvc
homepage :
	 https://commons.apache.org/daemon/jsvc.html
url :
	 https://www.apache.org/dyn/closer.cgi?path=commons/daemon/source/commons-daemon-1.1.0-native-src.tar.gz
description :
	 Wrapper to launch Java applications as daemons
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-arch #{MacOS.preferred_arch}"
	 ENV.append "LDFLAGS", "-arch #{MacOS.preferred_arch}"
	 ENV.append "CPPFLAGS", "-I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers"
	 prefix.install %w[NOTICE.txt LICENSE.txt RELEASE-NOTES.txt]
	 cd "unix"
	 system "./configure", "--with-java=/System/Library/Frameworks/JavaVM.framework",
	 "--with-os-type=Headers"
	 system "make"
	 bin.install "jsvc"
